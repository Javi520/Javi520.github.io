turtle.refuel()

function GuardarCofre()
    for inventory = 3, 9 do
        turtle.select(inventory)
        turtle.dropDown()
    end
end

function Plantar()
    if (not turtle.detectDown()) then
        turtle.select(1)
        turtle.placeDown()
    else
        turtle.digDown()
        turtle.select(1)
        turtle.placeDown()
    end
end

function HacerFila()
    for i=0, 12 do
        turtle.forward()
        Plantar()
    end
end

function GiroDerecha()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
end

function GiroIzquierda()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
end

function Execute()
    turtle.up()

    HacerFila()
    GiroDerecha()
    HacerFila()
    GiroIzquierda()
    HacerFila()
    GiroDerecha()
    HacerFila()

    GuardarCofre()

    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.down()
end


while true do
    turtle.refuel()
    Execute()
    print("Esperando a que sea hora de cosechar")
    print("Faltan 20 min")
   sleep(300)
   print("Faltan 15 min")
    sleep(300)
    print("Faltan 10 min")
   sleep(300)
   print("Faltan 5 min")
    sleep(300)
end
