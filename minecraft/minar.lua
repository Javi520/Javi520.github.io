local tArgs = { ... }
local turno = false
local first = true
filtro = {}
filtro["minecraft:cobblestone"] = 0
filtro["minecraft:sandstone"] = 1
filtro["explorercraft:marble"] = 2
filtro["minecraft:gravel"] = 3
filtro["minecraft:sand"] = 4
filtro["minecraft:stone"] = 5
filtro["explorercraft:basalt"] = 6
filtro["minecraft:dirt"] = 7

if #tArgs ~= 2 then
    print("Program <rows> <cows>")
    return
end

--Si no está en el filtro devuelve nil
function NumIdBlock(strID)
    print (filtro[strID])
    return filtro[strID]
end

function MinarConFiltro()
    local success, data = turtle.inspect() --si no hay bloque es más rápido no minar
    if success then
        if NumIdBlock(data.name) ~= nil then
            --debe ser un hacha para no conseguir objeto
            print("no quiero el bloque")
            turtle.dig("right")
        else
            turtle.dig()
        end
    end
end

function MinarConFiltroDown()
    local success, data = turtle.inspectDown() --si no hay bloque es más rápido no minar
    if success then
        if NumIdBlock(data.name) ~= nil then
            --debe ser un hacha para no conseguir objeto
            print("no quiero el bloque")
            turtle.digDown("right")
        else
            print(data.name)
            turtle.digDown()
        end
    end
end


--BuscaCombustible y lo usa
function Combustible()
    for i=1,16 do
        turtle.select(i)
        turtle.refuel()
    end
    turtle.select(1)
end

Combustible()
--Bucle "Eje Y"
    --Bucle "Eje X"
MinarConFiltroDown()
turtle.down()
for i = 1, tonumber(tArgs[1]) do
    if not first then
        MinarConFiltro()
        turtle.forward()
    else
        first = false
    end
    if turno then
        -- direction <-
        turtle.turnLeft()
    else
        -- direction ->
        turtle.turnRight()
    end
    for j = 1, tonumber(tArgs[2]) do
        MinarConFiltro()
        turtle.forward()
    end
    if turno then
        -- direction ->
        turtle.turnRight()
    else
        -- direction <-
        turtle.turnLeft()
    end
    turno = not turno
end
--para el siguiente nivel
turno = false
first = true
