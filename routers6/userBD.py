from fastapi import FastAPI, HTTPException, status
from db.models.user import user 
from db.schemas.user import userOnly, userJun 
from db.client import app as bd 
from bson import ObjectId
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=[
      "http://localhost:8080",
      "http://127.0.0.1:8080"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
#Mostrar todos los usuarios
@app.get("/mostrar")
async def mostrar():
    return userJun(bd.pedido_personalizados.find())

@app.post("/agregar")
async def agregar(us: user):
    dic_us = us.dict()
    dic_us.pop("id", None)

    inserted_id = bd.pedido_personalizados.insert_one(dic_us).inserted_id

    return {"id_pedido": str(inserted_id)}  # <-- devolverlo como string


    

# Modificar 
@app.put("/modificar")
async def modificar(us: user):
    if not us.id:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="ID requerido para modificar"
        )

    dict_us = dict(us)
    dict_us.pop("id", None)
    modificado = bd.userss.find_one_and_replace(
        {"_id": ObjectId(us.id)},
        dict_us
    )

    if not modificado:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Usuario no encontrado"
        )

    return userOnly(bd.userss.find_one({"_id": ObjectId(us.id)}))

# Eliminar
@app.delete("/eliminar/{id}")
async def eliminar(id: str):
    try:
        resultado = bd.userss.find_one_and_delete({"_id": ObjectId(id)})
        if not resultado:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="Usuario no encontrado"
            )
        return {"mensaje": "Usuario eliminado correctamente"}
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Error al eliminar: {str(e)}"
        )

# Buscar
@app.get("/mostrarGet")
async def mostrarGet(id: str):
    return buscar("_id",ObjectId(id))

def buscar(nombre:str, buscar):
    try:    

        lista = userOnly(bd.pedido_personalizados.find_one({nombre:buscar}))

        return user(**lista)

    except:

        return {"error":f"{nombre} no encontrado"}