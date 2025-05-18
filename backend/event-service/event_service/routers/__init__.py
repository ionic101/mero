from fastapi import APIRouter
from typing import List
from event_service.routers.participant import participant_router


routers: List[APIRouter] = [
    participant_router
]

__all__ = [
    'routers'
]
