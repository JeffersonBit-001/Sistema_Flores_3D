from fastapi import FastAPI,APIRouter
from pydantic import BaseModel

class user(BaseModel):
    id:int
    username: str
    name: str

user_list = [
    user(id=1,username="u000",name="juan"),
    user(id=2,username="u001",name="pepe"),
    user(id=3,username="u002",name="jhon")
]

def buscar(us: user):
    for item in user_list:
        if item.id == us.id or item.name == us.name:
            return item
    else:
        return {"Error":"usuario no encontrado"}
    

def buscar2(id:int):
    for item in user_list:
        if item.id == id:
            return item
    else:
        return {"Error":"usuario no encontrado"}


app = FastAPI()

@app.get("/mostrar")
async def mostrar():
    return user_list

@app.post("/insertar")
async def insertar(us:user):
    if type(buscar(us)) == user:
        return {"error":"usuario existente"}
    else:
        user_list.append(us)
        return user_list
    
@app.put("/modificar")
async def modificar(us:user):
    for index, item in enumerate(user_list):
        if item.id == us.id:
            user_list[index] = us
            return user_list
    else:
        return {"error":"no se pudo modificar"}
    
@app.delete("/eliminar/{id}")
async def eliminar(id:int):
    for index, item in enumerate(user_list):
        if item.id == id:
            del user_list[index]
            return user_list
    else:
        return {"error":"no se pudo eliminar"}
    
@app.get("/buscar")
async def buscarUser(id:int):
    return buscar2(id)