def userOnly(user) -> dict:
    return {
        "id": str(user["_id"]),
        "id_pedido": user["id_pedido"],
        "nombre": user["nombre"],
        "apellido_paterno": user["apellido_paterno"],
        "apellido_materno": user["apellido_materno"],
        "flores": [
            {
                "nombre": flor["nombre"],
                "color": flor["color"],
                "cantidad": flor["cantidad"],
                
                "precio": flor["precio"]

            } for flor in user["flores"]
        ],
        "decorativos": [
            {
                "nombre": mat["nombre"],
                "color": mat["color"],
                "cantidad": mat["cantidad"],
                "precio": mat["precio"]
            } for mat in user["decorativos"]
        ],
        "florero": {
            "nombre": user["florero"]["nombre"],
            "color": user["florero"]["color"],
            "precio": user["florero"]["precio"]
        },

        
        "notas_especiales": user.get("notas_especiales", ""),
        "cantidad": user["cantidad"],
        "precio_individual": user["precio_individual"],
        "precio_total": user["precio_total"]
    }


def userJun(users):
    return [userOnly(u) for u in users]