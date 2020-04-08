--argumentos del programa
local tArgs = { ... }
local rows
local cows

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
    rows = tonumber(tArgs[1])-1
    cows = tonumber(tArgs[2])-1
end

--Main
textutils.slowPrint("Creating block filter...")
local filtro = utils.createFilter(blocklist)
for i,v in ipairs(filtro) do
    print(v)
end
print("OK")
textutils.slowPrint("Checking fuel for at least 1 level...")
--toDo
textutils.slowPrint("Enough slots for at least 1 level?")
--toDo
textutils.slowPrint("Choosing Mining style, right or front?")
local right_first = true
local top = cows 
local sub = rows
turn_strategie = utils.cclock_rot_forward
if rows>cows then
    right_first = false
    turn_strategie = utils.clock_rot_forward
    top,sub = rows,cows
    print(" first right")
else
    print(" front right")
end
textutils.slowPrint("OK")
print("Start...")
textutils.slowPrint("Mining down...")
utils.nDown(1,utils.MinarConFiltroDown,filtro)
last_level=last_level+1
textutils.slowPrint("OK")
if(right_first) then
    turtle.turnRight()
end
for i=1,top do
    utils.nForward(cows,utils.MinarConFiltro,filtro)
    turn_strategie(utils.MinarConFiltro,filtro)
end