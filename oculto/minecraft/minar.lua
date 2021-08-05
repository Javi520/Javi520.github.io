local tArgs = { ... }
local turno = false
local first = true

os.loadAPI("utils")

blocklist = {
    utils.cobblestone,
    utils.sand,
    utils.sandstone,
    utils.dirt,
    utils.diamond,
    utils.marble,
    utils.gravel,
    utils.stone,
    utils.basalt,
    utils.oro,
    utils.hierro
}

filtro = utils.createFilter(blocklist)

--comprobación de argumentos
if true then
    if #tArgs ~= 2 then
        print("Program <rows> <cows>")
        return
    end

    rows = tonumber(tArgs[1])
    cows = tonumber(tArgs[2])
    
    if cows < rows then
        print ("Please its faster if we reverse the order, try again :)")
        return
    end
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
