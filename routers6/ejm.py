from fastapi import FastAPI, APIRouter
from pydantic import BaseModel


class User(BaseModel):
    id: int
    nombre: str
    cant: int

user_list = [User(id=1,nombre = "Juan", cant = 12),
             User(id=2,nombre = "Pepe", cant = 13)]

app = FastAPI()

def buscar(user2: User):
    for user in user_list:
        if user.id == user2.id:
            return user
        
    else:
        return {"error":"Usuario no encontrado"}


app.get("/mostrar")
async def mostrarUser():
    return "user_list"

app.get("/buscarUs")
async def buscarUs(id:int):
    return buscar(id)

app.post("/insertar")
async def insertar(user: User):
    if type(buscar(user))== User:
        return {"error":"este usuario ya existe"}
    else:
        user_list.append(user)
        return user_list
    
app.put("/modificar")
async def modificar(user: User):
    for index, ite in enumerate(user_list):
        if ite.id == user.id:
            user_list[index] = user
            return user_list
    else:
        return {"error":"usuario no encontrado"}
    
app.delete("/eliminar/{id}")
async def eliminar(id:int):
    for index, ite in enumerate(user_list):
        if ite.id == id:
            del user_list[index]
            return user_list
    else:
        return {"error":"usuario no encontrado"}