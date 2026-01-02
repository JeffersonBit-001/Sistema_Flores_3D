from fastapi import FastAPI, APIRouter, HTTPException, status,Depends
from pydantic import BaseModel

from fastapi.security import OAuth2PasswordRequestForm,OAuth2PasswordBearer

app = FastAPI()

clave = OAuth2PasswordBearer("login")

class user(BaseModel):
    id:int
    estado: str
    username:str

class userBD(user):
    password: str

lista_user = {
    "U000":{
        "id":1,
        "estado":"activo",
        "username":"U000",
        "password":"123"
    },

    "U001":{
        "id":2,
        "estado":"inactivo",
        "username":"U001",
        "password":"1234"
    }
}

def buscar(username:str):
    if username in lista_user:
        return userBD(**lista_user[username])
    
def buscar2(username:str):
    if username in lista_user:
        return user(**lista_user[username])

@app.post("/login")
async def login(form: OAuth2PasswordRequestForm = Depends()):
    varItem = lista_user.get(form.username)

    if not varItem:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,detail="Credenciales incorrectas"
        )
    
    item_us = buscar(form.username)

    if not item_us:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,detail=""
        )
    
    return {
        "access_token":item_us.username,
        "token_type":"bearer"
    }


def current(token:str = Depends(clave)):
    user_li = lista_user.get(token)

    if not user_li:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Clave incorrecto"
        )

    user_item = buscar2(token)

    if not user_item:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Clave incorrecto"
        )
    
    return user_item


@app.get("/me")
async def me(us:user = Depends(current)):
    return us