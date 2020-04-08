--argumentos del programa
local tArgs = { ... }

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

    local rows = tonumber(tArgs[1])
    local cows = tonumber(tArgs[2])
end

--Main
textutils.slowPrint("Creating block filter...")
local filtro = utils.createFilter(blocklist)
print("OK")
textutils.slowprint("Checking fuel for at least 1 level...")
--toDo
textutils.slowprint("Enough slots for at least 1 level?")
--toDo
textutils.slowprint("Choosing Mining style, right or front?")
local right_first = false
local top = rows 
local sub = cows
turn_strategie = utils.cclock_rot_forward
if cows<rows then
    right_first = true
    turn_strategie = utils.clock_rot_forward
    top,sub = cows,rows
    print(" first right")
else
    print(" front right")
end
textutils.slowPrint("OK")
print("Start...")
textutils.slowPrint("Mining down...")
utils.nDown(1,utils.MinarConFiltroDown,blocklist)
last_level++
textutils.slowPrint("OK")
if(right_first) then
    turtle.turnRight()
end
for i=1,top do
    utils.nForward(cows,utils.MinarConFiltro,blocklist)
    turn_strategie(utils.MinarConFiltro,blocklist)
end