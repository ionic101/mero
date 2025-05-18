from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

from event_service.schemas.participant_create import ParticipantCreateRequest
from event_service.utils.async_session import get_session
from event_service.utils import async_session
from event_service.models.participants_model import ParticipantsModel
from datetime import datetime, time, timezone
from event_service.utils import token_generator
from event_service.models.events_participants_model import EventsParticipantsModel
from event_service.models.events_model import EventsModel
from event_service.utils import jwt_controller


participant_router: APIRouter = APIRouter(prefix='/participant')


async def generate_token(db: AsyncSession) -> int:
    while True:
        new_token = int(token_generator.generate())
        query = select(EventsParticipantsModel.token).where(EventsParticipantsModel.token == new_token)
        result = await db.execute(query)
        existing_token = result.scalar_one_or_none()
        if not existing_token:
            return new_token


@participant_router.post('/create/{event_id}')
async def register_participant(event_id: int, request: ParticipantCreateRequest, db: AsyncSession = Depends(get_session)):
    event = await db.get(EventsModel, event_id)
    if not event:
        return {'status': 'bad', 'message': f'Event with id {event_id} not found'}
    
    new_participant: ParticipantsModel = ParticipantsModel(
        name=request.name,
        surname=request.surname,
        birth_date=datetime.combine(request.birth_date, time.min, tzinfo=timezone.utc)
    )
    await async_session.add_record_db(db, new_participant)

    token = await generate_token(db)
    new_relationship: EventsParticipantsModel = EventsParticipantsModel(
        token = token,
        event_id = event.id,
        participant_id = new_participant.id
    )
    await async_session.add_record_db(db, new_relationship)
    
    return {'status': 'ok', 'token': token}



@participant_router.post('/login/{token}')
async def login_participant(token: int, db: AsyncSession = Depends(get_session)):
    query = select(EventsParticipantsModel).where(EventsParticipantsModel.token == token)
    result = await db.execute(query)
    relationship: EventsParticipantsModel | None = result.scalar_one_or_none()
    if not relationship:
        return {'status': 'bad', 'message': 'not found'}
    data = {
        'participant_id': relationship.participant_id,
        'event_id': relationship.event_id
    }
    return {'status': 'ok', 'JWT': jwt_controller.create_token(data)}
