--Esto es una API
cobblestone = "minecraft:cobblestone"
sandstone = "minecraft:sandstone"
marble = "explorercraft:marble"
gravel = "minecraft:gravel"
sand = "minecraft:sand"
stone = "minecraft:stone"
basalt = "explorercraft:basalt"
dirt = "minecraft:dirt"
diamond = "minecraft:diamond_ore"
oro = "minecraft:gold_ore"
hierro = "minecraft:iron_ore"

--Creo y devuelvo un filtro con una lista de bloques
function createFilter(list)
    local filter = {}
    for i,v in ipairs(list) do
        filter[v] = i
    end
    return filter
end

--Si no está en el filtro devuelve nil
function NumIdBlock(filtrillo,strID)
    return filtrillo[strID]
end

--Busca combustible y lo equipa todo
function Combustible()
    for i=1,16 do
        turtle.select(i)
        if(turtle.refuel()) then
            turtle.select(1)
            return
        end
    end
    turtle.select(1)
end

function Combustible( amount )
    for i=1,16 do
        turtle.select(i)
        if(turtle.refuel(amount)) then
            turtle.select(1)
            return
        end
    end
    turtle.select(1)
end


--Movimientos tortugas

--gira la tortuga 90º horarios
--llama a <toDoEachStep>
--avanza y gira otros 90º horarios
function clock_rot_forward( toDoEachStep , argu)
    turtle.turnRight()
    toDoEachStep(argu)
    turtle.forward()
    turtle.turnRight()
end

--gira la tortuga 90º anti-horarios
--llama a <toDoEachStep>
--avanza y gira otros 90º anti-horarios
function cclock_rot_forward( toDoEachStep , argu)
    turtle.turnLeft()
    toDoEachStep(argu)
    turtle.forward()
    turtle.turnLeft()
end

--llama a <toDoEachStep>
--avanza
--n veces
function nForward( n, toDoEachStep , argu)
    for i=1,n do
        toDoEachStep(argu)
        turtle.forward()
    end
end

--llama a <toDoEachStep>
--retrocede
--n veces
function nBack( n, toDoEachStep , argu)
    for i=1,n do
        toDoEachStep(argu)
        turtle.back()
    end
end

--llama a <toDoEachStep>
--desciende
--n veces
function nDown( n, toDoEachStep , argu)
    for i=1,n do
        toDoEachStep(argu)
        turtle.down()
    end
end

--llama a <toDoEachStep>
--asciende
--n veces
function nUp( n, toDoEachStep , argu)
    for i=1,n do
        toDoEachStep(argu)
        turtle.up()
    end
end

--combustible necesario para recorrer un rectangulo
--pasando por todos los cuadros 1 sola vez
function howMuchFuelDoINeed ( width, height )
    return (width*height)
end

--tortugas en accion

--Si hay el elemento de delante es uno que esté en el filtro
--la tortuga lo "trabajará" con la herramienta de la derecha
--para no obtener el bloque
function MinarConFiltro( filtrillo )
    local success, data = turtle.inspect() --si no hay bloque es más rápido no minar
    if success then
        if NumIdBlock(filtrillo, data.name) ~= nil then
            --debe ser un hacha para no conseguir objeto
            print("no quiero el bloque")
            turtle.dig("right")
        else
            turtle.dig()
        end
    end
end

--Si hay el elemento de abajo es uno que esté en el filtro
--la tortuga lo "trabajará" con la herramienta de la derecha
--para no obtener el bloque
function MinarConFiltroDown( filtrillo )
    local success, data = turtle.inspectDown() --si no hay bloque es más rápido no minar
    if success then
        if NumIdBlock(filtrillo, data.name) ~= nil then
            --debe ser un hacha para no conseguir objeto
            print("no quiero el bloque")
            turtle.digDown("right")
        else
            print(data.name)
            turtle.digDown()
        end
    end
end

--moves the turtle in a rectangle (<w>idth, <h>eight)
--and calls <toDoEachStep>
--with a list of arguments <arg_list> of length arg_qty
function RectangleWithAction( rows, cows, toDoEachStep, argu)
    local right_first = true
    local top = rows
    local sub = cows
    local turn_strategie_1 = cclock_rot_forward
    local turn_strategie_2 = clock_rot_forward
if rows>cows then
    right_first = false
    turn_strategie_2 = cclock_rot_forward
    turn_strategie_1 = clock_rot_forward
    top,sub = cows,rows
end
    if(right_first) then
        turtle.turnRight()
    end
    for i=1,top-1 do
        nForward(sub,toDoEachStep,argu)
        turn_strategie_1(toDoEachStep,argu)
        change = turn_strategie_1
        turn_strategie_1 = turn_strategie_2
        turn_strategie_2 = change
    end
    --last iteration, doing this, no last turn
    nForward(sub,toDoEachStep,argu)
end