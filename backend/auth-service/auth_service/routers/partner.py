from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select

from auth_service.schemas.partner_register import PartnerRegisterRequest
from auth_service.utils.async_session import get_session
from auth_service.utils import async_session
from auth_service.models.partners_model import PartnersModel
from auth_service.schemas.partner_login import PartnerLoginRequest
from auth_service.utils.jwt_controller import create_token


partner_register: APIRouter = APIRouter(prefix='/partner')


@partner_register.post('/register')
async def register_partner(request: PartnerRegisterRequest, db: AsyncSession = Depends(get_session)):
    new_partner: PartnersModel = PartnersModel(
        name = request.name,
        login = request.login,
        password = request.password
    )
    await async_session.add_record_db(db, new_partner)
    return {'status': 'success'}

@partner_register.post('/login')
async def login_event(request: PartnerLoginRequest, db: AsyncSession = Depends(get_session)):
    query = select(PartnersModel).where(
        PartnersModel.login == request.login,
        PartnersModel.password == request.password
    )
    result = await db.execute(query)
    event = result.scalar_one_or_none()
    if event is None:
        return {'status': 'not found'}

    return {'status': 'success', 'JWT': create_token({
        'id': event.id,
        'name': event.name
    })}
