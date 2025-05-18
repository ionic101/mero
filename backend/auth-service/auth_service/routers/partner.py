from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from auth_service.schemas.partner_register import PartnerRegisterRequest
from auth_service.utils.async_session import get_session
from auth_service.utils import async_session
from auth_service.models.partners_model import PartnersModel


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
