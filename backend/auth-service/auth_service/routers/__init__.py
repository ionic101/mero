from fastapi import APIRouter
from typing import List
from auth_service.routers.event import event_router
from auth_service.routers.partner import partner_register


routers: List[APIRouter] = [
    event_router,
     partner_register
]

__all__ = [
    'routers'
]
