from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

from auth_service.schemas.event_register import EventRegisterRequest
from auth_service.schemas.event_login import EventLoginRequest
from auth_service.utils.async_session import get_session
from auth_service.utils import async_session
from auth_service.models.events_model import EventsModel
from auth_service.utils.jwt_controller import create_token


event_router: APIRouter = APIRouter(prefix='/event')


@event_router.post('/register')
async def register_event(request: EventRegisterRequest, db: AsyncSession = Depends(get_session)):
    new_event: EventsModel = EventsModel(
        name = request.name,
        login = request.login,
        password = request.password
    )
    await async_session.add_record_db(db, new_event)
    return {'status': 'success', 'event_id': new_event.id}


@event_router.post('/login')
async def login_event(request: EventLoginRequest, db: AsyncSession = Depends(get_session)):
    query = select(EventsModel).where(
        EventsModel.login == request.login,
        EventsModel.password == request.password
    )
    result = await db.execute(query)
    event = result.scalar_one_or_none()
    if event is None:
        return {'status': 'not found'}

    return {'status': 'success', 'JWT': create_token({
        'id': event.id,
        'name': event.name
    })}
