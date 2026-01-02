from fastapi import FastAPI, APIRouter, HTTPException, status, Depends
from pydantic import BaseModel

from fastapi.security import OAuth2PasswordBearer,OAuth2PasswordRequestForm


from jose import jwt ,JWTError

from passlib.context import CryptContext

from datetime import datetime,timedelta

app = FastAPI()

clave = OAuth2PasswordBearer(tokenUrl="login")

ALGORITMO = "HS256"
minutos = 1
BCRY = CryptContext(schemes=["bcrypt"])
SECRET = "201d573bd7d1344d3a3bfce1550b69102fd11be3db6d379508b6cccc58ea230b"

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
        "password":"$2a$12$X5eUMfbngiIziP0oTPjNQuYbVMMo6e3iUP9ITCOgXqJKoY0SU/in2"
    },

    "U001":{
        "id":2,
        "estado":"inactivo",
        "username":"U001",
        "password":"$2a$12$9dt/uKqn7c1F885Jcubs6./Nchhnbd.aho6GA5A2pNgqwG0tX8Bh2"
    }
}

def buscar(username:str):
    if username in lista_user:
        return userBD(**lista_user[username])
    
def buscar2(username:str):
    if username in lista_user:
        return user(**lista_user[username])


@app.post("/login")
async def login(form : OAuth2PasswordRequestForm = Depends()):
    varItem = lista_user.get(form.username)

    if not varItem:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,detail="Credenciales incorrectas"
        )
    
    item_us = buscar(form.username)

    if not (BCRY.verify(form.password, item_us.password)):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,detail="Error"
        )
    
    token = {
        "sub":item_us.username,
        "exp": datetime.utcnow() + timedelta(minutes=minutos)
    }

    return {
        "access_token":jwt.encode(token, SECRET, algorithm=ALGORITMO),
        "token_type":"bearer"
    }


def current(token: str = Depends(clave)):

    error = HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST, detail="error clves"
    )
    
    try:
        tokennue = jwt.decode(token,SECRET, algorithms=[ALGORITMO]).get("sub")

        if tokennue is None:
            raise error
    

    except JWTError:
        raise error
    
    bus = buscar2(tokennue)
    
    return bus

@app.get("/me")
async def me(user: user = Depends(current)):
    return user