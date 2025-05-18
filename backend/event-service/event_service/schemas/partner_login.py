from pydantic import BaseModel


class PartnerLoginRequest(BaseModel):
    login: str
    password: str
