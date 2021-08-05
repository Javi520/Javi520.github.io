--argumentos del programa
local tArgs = { ... }
local rows
local cows
local filtro = {}
local change
local last_x
local last_y

--ultima altura a la que estuvo la tortuga
local last_level = 0

--aqui tengo funciones utiles comunes
os.loadAPI("utils")

--lista de bloques que me interesa tener apuntados
local blocklist = {
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

--comprobación de argumentos
if true then
    if #tArgs ~= 2 then
        print("Program <rows> <cows>")
        return
    end
    rows = tonumber(tArgs[1])
    cows = tonumber(tArgs[2])
end

if(rows>cows)then
    last_x = cows
    if(math.fmod(cows,2)==0)then
        last_y = 0
    else
        last_y = rows
    end
else
    last_y = rows
    if(math.fmod(rows,2)==0)then
        last_x = 0
    else
        last_x = cows
    end
end

local function ReturnToStart()
    if(last_x == 0)then
        turtle.turnLeft()
        utils.nForward(rows,function()end,nil)
        turtle.turnLeft()
        turtle.turnLeft()
        return
    elseif last_y == 0 then
        turtle.turnRight()
        utils.nForward(cows,function()end,nil)
        turtle.turnRight()
        return
    elseif rows>cows then
        turtle.turnLeft()
        utils.nForward(cows,function()end,nil)
        turtle.turnLeft()
        utils.nForward(rows,function()end,nil)
        turtle.turnRight()
        turtle.turnRight()
    else
        turtle.turnRight()
        utils.nForward(rows,function()end,nil)
        turtle.turnRight()
        utils.nForward(cows,function()end,nil)
        turtle.turnRight()
    end
end

--Main
print("Creating block filter...")
filtro = utils.createFilter(blocklist)
print("OK")
print("Checking fuel for at least 1 level...")
print(utils.howMuchFuelDoINeed(rows,cows)+last_x+last_y+last_level)
--toDo
print("Enough slots for at least 1 level?")
--toDo
print("Start...")
turtle.forward()
print("Mining down...")
utils.nDown(1,utils.MinarConFiltroDown,filtro)
last_level=1
print("OK")
utils.RectangleWithAction(rows,cows,utils.MinarConFiltro,filtro)
print("Returning")
ReturnToStart()