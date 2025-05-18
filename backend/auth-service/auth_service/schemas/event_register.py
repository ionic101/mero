from pydantic import BaseModel


class EventRegisterRequest(BaseModel):
    name: str
    login: str
    password: str
