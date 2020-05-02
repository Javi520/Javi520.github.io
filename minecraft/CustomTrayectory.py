from dataclasses import dataclass
import numpy as np

@dataclass
class Solution:
    movements: np.array
    turn_count: int = 0
    mov_count: int = 0

m_1 = np.array(
    [
    [0,0,0,0,0],
    [1,1,1,1,1],
    ])

for e in m_1:
    print (e)
    pass
#{
#   0   0   0   0   0   0   0   0   0
#   0   0   0   2   2   0   0   0   0
#   0   0   0   3   2   0   0   0   0
#   0   0   0   2   0   0   0   0   0
#   0   0   0   1   0   0   0   0   0
#   0   0   0   0   0   0   0   0   0
# convention about points
# first situation 1 conexion
#   -   0   -   |   -   x   -   |   -   0   -   |   -   0   - 
#   0  -1   0   |   0   1   0   |   x  -5   0   |   0   5   x
#   -   x   -   |   -   0   -   |   -   0   -   |   -   0   -
# }

#possible paths
#{
# 1- {2,3,2}
# 2- 
# 3- 
# 4- 
# 5- }

#Devuelve una lista de <quantity> 0´s
def lista_0s(quantity:int=0, lista:list=[]):
    if quantity <= 0:
        return lista
    else:
        return lista_0s(quantity=quantity-1, lista=lista.__add__([0]))

#Dada una matriz de 0´s y 1´s, sin marco de 0´s,
#la proceso para que cada punto refleje la cantidad de correlativos y la posicion de estos
def MAT_binary_to_nearmine(matriz:np.array):
    for y in matriz[0:1]:
        print("[",end="")
        for x in y:
            print(x,end=" ")
        print("]")

MAT_binary_to_nearmine(m_1)
print(lista_0s(10))