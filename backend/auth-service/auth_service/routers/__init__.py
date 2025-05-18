from fastapi import APIRouter
from typing import List
from auth_service.routers.event import event_router


routers: List[APIRouter] = [
    event_router
]

__all__ = [
    'routers'
]
