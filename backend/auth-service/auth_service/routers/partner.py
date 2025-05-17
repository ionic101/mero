from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from auth_service.schemas import PartnerLoginRequest
from auth_service.utils.session import get_session
from auth_service.models.partners_model import PartnersModel
from auth_service.utils.jwt_controller import create_token, decode_token
from auth_service.errors.errors import IncorrcetEmailOrPasswordError
from auth_service.utils.logger import logger

from auth_service.schemas.partner import *


partner_router: APIRouter = APIRouter(prefix='/partner')


@partner_router.post('/login', response_model=PartnerLoginResponse)
def login_partner(login_request: PartnerLoginRequest, db: Session = Depends(get_session)):
    partner: PartnersModel | None = db.query(PartnersModel).filter(PartnersModel.email == login_request.email).first()
    if not partner:
        ### logger.error(f'Partner {register_data.email} failed to log in')
        raise IncorrcetEmailOrPasswordError(detail='Incorrcet email')
    ### logger.info(f'Partner {partner.email} logged in')
    return PartnerLoginResponse(
        status='ok',
        JWT=create_token({
            'id': partner.id,
            'sub': str(partner.sub)
        })
    )


@partner_router.post('/register', response_model=PartnerRegisterResponse)
def register_partner(register_request: PartnerRegisterRequest, db: Session = Depends(get_session)):
    # Check mail used in system or not
    existing_partner: PartnersModel | None = db.query(PartnersModel).filter(PartnersModel.email == register_request.email).first()
    if existing_partner:
        ### logger.error(f'Email {register_data.email} already registered')
        raise HTTPException(status_code=400, detail='Email already registered')

    new_partner: PartnersModel = PartnersModel(
        email=register_request.email,
        company=register_request.company,
        tin=register_request.TIN,
        phone_number=register_request.phone_number
    )
    db.add(new_partner)
    db.commit()
    db.refresh(new_partner)

    ### logger.info(f'Partner {new_partner.email} registered')
    return PartnerRegisterResponse(
        status='ok',
        JWT=create_token({
            'id': new_partner.id,
            'sub': str(new_partner.sub)
        })
    )


@partner_router.put('/update', response_model=PartnerUpdateResponse)
def update_partner(update_request: PartnerUpdateRequest, db: Session = Depends(get_session)):
    token_data: dict = decode_token(update_request.JWT)
    partner: PartnersModel | None = db.query(PartnersModel).filter(PartnersModel.id == token_data['id']).first()
    if partner is None:
        raise HTTPException(status_code=400, detail='Partner not found')

    if update_request.email:
        existing_partner: PartnersModel | None = db.query(PartnersModel).filter(PartnersModel.email == update_request.email).first()
        if existing_partner:
            ### logger.error('Email already in use')
            raise HTTPException(status_code=400, detail='Email already in use')
        partner.email = str(update_request.email) # type: ignore
    if update_request.TIN:
        ### logger.info(f'Partner {partner.email} updated TIN')
        partner.tin = update_request.TIN # type: ignore
    if update_request.phone_number:
        ### logger.info(f'Partner {partner.email} updated phone number')
        partner.phone_number = update_request.phone_number # type: ignore
    if update_request.company:
        ### logger.info(f'Partner {partner.email} updated company name')
        partner.company = update_request.company # type: ignore

    db.commit()
    db.refresh(partner)
    ### logger.info(f'Partner {partner.email} updated')

    return PartnerUpdateResponse(status='ok')


@partner_router.delete('/delete', response_model=PartnerDeleteResponse)
def delete_partner(delete_request: PartnerDeleteRequest, db: Session = Depends(get_session)):
    token_data: dict = decode_token(delete_request.JWT)
    partner: PartnersModel | None = db.query(PartnersModel).filter(PartnersModel.id == token_data['id']).first()
    if partner is None:
        raise HTTPException(status_code=400, detail='Partner not found')
    
    db.delete(partner)
    db.commit()

    return PartnerDeleteResponse(status='ok')
