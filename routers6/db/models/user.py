from typing import List, Optional
from pydantic import BaseModel


class Flor(BaseModel):
    nombre: str
    color: str
    cantidad: int
    precio: float


class Decorativo(BaseModel):
    nombre: str
    color: str
    cantidad: int
    precio: float


class Florero(BaseModel):
    nombre: str
    color: str
    precio: float


class user(BaseModel):
    id: Optional[str] = None
    id_pedido: str
    nombre: str
    apellido_paterno: str
    apellido_materno: str

    flores: List[Flor]
    decorativos: List[Decorativo]
    florero: Florero

    notas_especiales: Optional[str] = None
    cantidad: int
    precio_individual: float
    precio_total: float