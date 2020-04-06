--Esto es una API

bloques = {}
bloques["minecraft:cobblestone"] = 0
bloques["minecraft:sandstone"] = 1
bloques["explorercraft:marble"] = 2
bloques["minecraft:gravel"] = 3
bloques["minecraft:sand"] = 4
bloques["minecraft:stone"] = 5
bloques["explorercraft:basalt"] = 6
bloques["minecraft:dirt"] = 7
bloques["minecraft:"] = 8

--Si no está en el filtro devuelve nil
function NumIdBlock(strID)
    return filtro[strID]
end