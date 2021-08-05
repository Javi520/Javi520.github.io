from graphics import *

win = GraphWin(title = "Custom_Trayectory", width = 700, height = 700) # create a window
win.setCoords(0, 0, 10, 10) # set the coordinates of the window; bottom left is (0, 0) and top right is (10, 10)
mySquare = Rectangle(Point(1, 1), Point(9, 9)) # create a rectangle from (1, 1) to (9, 9)
win_dialog = GraphWin(width = 200, height = 200)
win.setCoords(0,0,10,10)
text = Text(Point(2,2),text="¿Cuántos cuadrados quieres(Máx 9999?")
inputBox = Entry(Point(3,5),4)
text.draw(win_dialog)
inputBox.draw(win_dialog)
mySquare.draw(win) # draw it to the window
print (win.getMouse()) # pause before closing

def loop():
#loop design
    #switch (message)
    #case: clear
        #erase path
    #case: build
        #build lua code for this path
    #case: analyze
        #check if its a valid path
    print (win.getMouse())

def main():
    print ("none")
    while (True):
        loop()
#main
main()