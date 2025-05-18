from pydantic import BaseModel


class EventLoginRequest(BaseModel):
    login: str
    password: str
