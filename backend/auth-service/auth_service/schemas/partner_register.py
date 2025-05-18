from pydantic import BaseModel


class PartnerRegisterRequest(BaseModel):
    name: str
    login: str
    password: str
