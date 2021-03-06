nivelesVaciar = 3

local arg = { ... }
if (tonumber(arg[1])) then
    argumento = tonumber(arg[1])
else
    print("Introduce un numero")
    return
end

if argumento then
    if (argumento < 0) then
        print("Introduce un numero positivo e impar")
        return
    else
        if (argumento % 2 == 1) then
            radioOriginal = argumento
        else
            print("Introduce un numero impar")
            return
        end
    end
else
    print("Introduce un radio - Tiene que ser un numero impar")
    return
end

profundidad = 0
contadorNiveles = 0
vueltas = 3
radio = radioOriginal

function Combustible()
    for i=1,16 do
        turtle.select(i)
        turtle.refuel()
    end
    turtle.select(1)
end

function MinarLinea(n)
    for i=1, n do
        if (not turtle.dig()) then
            if (not turtle.forward()) then
                return false
            end
        else
            turtle.forward()
        end
    end
    return true
end

function Recolocar()
    for i=1,(radioOriginal+1)/2 do
        turtle.forward()
    end
    turtle.turnLeft()
    for i=1,(radioOriginal-1)/2 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
end

function MinarNivel()
    if (not turtle.digDown()) then
        if (not turtle.down()) then
            return false
        end
    else
        turtle.down()
    end
    profundidad = profundidad + 1

    while vueltas>0 do
        if (not MinarLinea(radio)) then
            return false
        end
        vueltas = vueltas - 1
        if (vueltas == 0) then
            radio = radio - 1
            if (radio == 0) then
                vueltas = 0
            else
                vueltas = 2
            end
         end
        turtle.turnRight()
    end
    radio = radioOriginal
    vueltas = 3
    contadorNiveles = contadorNiveles + 1
    return true
end

function Vaciar()
    for i=1, profundidad+1 do
        turtle.up()
    end
    turtle.back()

    for i=1,16 do
        turtle.select(i)
        turtle.dropDown()
    end

    turtle.forward()
    for i=1, profundidad+1 do
        turtle.down()
    end
    contadorNiveles = 0
end

function Terminar()
    for i=1, profundidad+1 do
        turtle.up()
    end
end

function execute()
    Combustible()

    while contadorNiveles < nivelesVaciar do
        if (not MinarNivel()) then
            Terminar()
            return
        end
        Recolocar()
    end

    Combustible()
    Vaciar()
    return true
end

while true do
    if (not execute()) then
        break
    end
end
