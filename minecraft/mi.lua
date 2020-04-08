--argumentos del programa
local tArgs = { ... }
local rows
local cows
local filtro = {}

--ultima altura a la que estuvo la tortuga
local last_level = 0

--aqui tengo funciones utiles comunes
os.loadAPI("utils")

local function swap( a, b )
    local temp = a
    a = b
    b = temp
end

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

--Main
print("Creating block filter...")
filtro = utils.createFilter(blocklist)
for i,v in ipairs(filtro) do
    print(v)
end
print("OK")
print("Checking fuel for at least 1 level...")
--toDo
print("Enough slots for at least 1 level?")
--toDo
print("Choosing Mining style, right or front?")
local right_first = true
local top = rows 
local sub = cows
local turn_strategie_1 = utils.cclock_rot_forward
local turn_strategie_2 = utils.clock_rot_forward
if rows>cows then
    right_first = false
    turn_strategie_2 = utils.cclock_rot_forward
    turn_strategie_1 = utils.clock_rot_forward
    top,sub = cows,rows
    print(" first right")
else
    print(" front right")
end
print("OK")
print("Start...")
turtle.forward()
print("Mining down...")
utils.nDown(1,utils.MinarConFiltroDown,filtro)
last_level=last_level+1
print("OK")
if(right_first) then
    turtle.turnRight()
end
for i=1,top do
    utils.nForward(sub,utils.MinarConFiltro,filtro)
    turn_strategie_1(utils.MinarConFiltro,filtro)
    swap(turn_strategie_1,turn_strategie_2)
end