from typing import List

import uvicorn
from fastapi import FastAPI, APIRouter

from auth_service.routers import routers
from auth_service.utils.config import config


def bind_routers(app: FastAPI, routers: List[APIRouter]) -> None:
    for router in routers:
        app.include_router(router)


def get_app() -> FastAPI:
    app: FastAPI = FastAPI(title='Mero Auth Service')
    bind_routers(app, routers)
    return app


def main() -> None:
    uvicorn.run(
        'auth_service.__main__:app',
        host=config.APP_HOST,
        port=config.APP_PORT,
        reload=True
    )


app: FastAPI = get_app()

if __name__ == '__main__': 
    main()
