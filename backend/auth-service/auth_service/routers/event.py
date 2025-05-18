from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from auth_service.schemas.event_register import EventRegisterRequest
from auth_service.utils.async_session import get_session
from auth_service.utils import async_session
from auth_service.models.events_model import EventsModel


event_router: APIRouter = APIRouter(prefix='/event')


@event_router.post('/register')
async def register_event(request: EventRegisterRequest, db: AsyncSession = Depends(get_session)):
    new_event: EventsModel = EventsModel(
        name = request.name,
        login = request.login,
        password = request.password
    )
    await async_session.add_record_db(db, new_event)
    return {'status': 'success'}
