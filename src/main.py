import pygame
import sys
import time

from pygame.locals import *
from pygame.color import *
pygame.init()
ani = 1
Perso = 1
Reset = 0
lvl = 0     
tiles = []
a = 0
b = 0
larg = 64

black = 0,0,0


img = pygame.image.load("Perso1Down.png")


def End():
    for x in range(10) :
        for y in range(10) :
            if getMap(x,y) == 3 :
                return False
    return True

def dispmap(tab,imgs) :
    for x in range(10) :
        for y in range(10) :
            screen.blit(imgs[tab[y][x]],(x*larg,y*larg) )
     
def getMap(x,y,):
    if x<0 or y <0 or x >9 or y > 9:
        return -1;
    return themap[y][x]
def setMap(x,y,val):
    themap[y][x] = val
    
def testCol(x,y): 
    return getMap(x,y)==0 or getMap(x,y)==3

def Push(posX,posY,ani):
    print ani
    if ani == 1 :
        a = posX + 0
        b = posY + 1
        c = posX + 0
        d = posY + 2
    elif ani == 2 :
        a = posX - 1
        b = posY + 0
        c = posX - 2
        d = posY + 0
    elif ani == 3 :
        a = posX + 1
        b = posY + 0
        c = posX + 2
        d = posY + 0
    elif ani == 4 :
        a = posX + 0
        b = posY - 1
        c = posX + 0
        d = posY - 2
    print a,b
    if ((getMap(a,b)==2) and (getMap(c,d)==0)): # si diammant et case vide
        setMap(a,b,0)
        setMap(c,d,2)
        print a
    elif ((getMap(a,b)==2) and (getMap(c,d)==3)):
        setMap(a,b,0)
        setMap(c,d,4)
    elif ((getMap(a,b)==4) and (getMap(c,d)==0)): # si diammant et case vide
        setMap(a,b,3)
        setMap(c,d,2)
    elif ((getMap(a,b)==4) and (getMap(c,d)==3)): # si diammant et case vide
        setMap(a,b,3)
        setMap(c,d,4)
    
        
for i in range(14):
    tiles.append( pygame.image.load("%s.png" % i ) )

size = width, height = 640, 640

screen = pygame.display.set_mode(size)

keys_old = None
while True :
    if lvl == -2 :
        themap = [  [6,6,6,6,6,6,6,6,6,6],
                    [1,1,1,1,1,1,1,1,1,1],
                    [1,3,3,3,3,3,3,3,3,1],
                    [1,0,0,0,0,0,0,0,0,1],
                    [1,0,0,0,0,0,0,0,0,1],
                    [1,3,3,3,3,3,3,3,3,1],
                    [1,1,1,1,1,1,1,1,1,1],
                    [6,6,6,6,6,6,6,6,6,6],
            ]
        posX = 1
        posY = 3   
    if lvl == -1 :
        themap =  [ [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,9,10,11,12,13,6,6,6],
                    [1,1,1,1,1,1,1,1,1,1],
                    [1,0,3,3,3,3,3,3,0,1],
                    [1,0,0,0,2,0,0,0,0,1],
                    [1,0,0,0,0,0,0,0,0,1],
                    [1,1,1,1,1,1,1,1,1,1]         
        ]
        posX = 4
        posY = 8     
    elif lvl == 0 :
        themap = [  [1,1,1,1,1,6,6,6,6,6],
                    [1,0,0,0,1,6,6,6,6,6],
                    [1,0,0,0,1,6,6,6,6,6],
                    [1,0,0,3,1,7,6,6,6,6],
                    [1,0,0,0,1,6,6,6,6,6],
                    [1,0,2,0,1,6,6,6,6,6],
                    [1,0,0,0,1,6,6,6,6,6],
                    [1,0,0,3,1,8,6,6,6,6],
                    [1,0,0,0,1,6,6,6,6,6],
                    [1,1,1,1,1,6,6,6,6,6]         
        ]
        posX = 1
        posY = 5
        
    elif lvl == 1 :
        themap = [  [6,6,6,6,6,6,6,6,6,6],
                    [6,6,1,1,1,1,1,6,6,6],
                    [6,6,1,3,3,3,1,6,6,6],
                    [6,6,1,1,2,0,1,6,6,6],
                    [6,6,1,1,0,0,1,1,6,6],
                    [6,6,1,0,2,2,0,1,6,6],
                    [6,6,1,0,0,0,1,1,6,6],
                    [6,6,1,0,0,1,1,6,6,6],
                    [6,6,1,1,1,1,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],         
        ]
        posX = 4
        posY = 4
        
    elif lvl == 2 :
        themap = [  [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6], 
                    [6,6,1,1,1,1,1,6,6,6],
                    [6,6,1,0,0,0,1,6,6,6],
                    [6,6,1,3,0,2,1,1,1,6],
                    [6,6,1,3,0,0,0,0,1,6],
                    [6,6,1,1,2,0,1,0,1,6],
                    [6,6,6,1,0,0,0,0,1,6],
                    [6,6,6,1,1,1,1,1,1,6],
                    [6,6,6,6,6,6,6,6,6,6],                    
        ]
        posX = 5
        posY = 5
        
    elif lvl == 3 :
        themap = [  [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,1,1,1,6,6,6,6], 
                    [6,6,1,1,0,1,1,6,6,6],
                    [6,1,1,3,2,0,1,6,6,6],
                    [6,1,3,3,3,0,1,1,6,6],
                    [6,1,2,3,2,0,0,1,6,6],
                    [6,1,0,2,0,0,1,1,6,6],
                    [6,1,0,2,1,1,1,6,6,6],
                    [6,1,0,0,1,6,6,6,6,6],
                    [6,1,1,1,1,6,6,6,6,6],                       
        ]
        posX = 2
        posY = 7
        
    elif lvl == 4 :
        themap =  [ [6,6,6,6,6,6,6,6,6,6],
                    [6,6,1,1,1,1,1,6,6,6],
                    [6,6,1,0,0,0,1,1,1,6],
                    [6,1,1,0,0,0,0,0,1,6],
                    [6,1,3,0,2,3,2,0,1,6],
                    [6,1,1,0,1,0,1,1,1,6],
                    [6,6,1,0,0,0,1,6,6,6],
                    [6,6,1,1,1,1,1,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
        ]
        posX = 4
        posY = 2

    elif lvl == 5 :
        themap =  [ [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,1,1,1,1,6,6,6],
                    [6,1,1,1,0,0,1,1,1,1],
                    [6,1,0,0,0,0,0,2,0,1],
                    [6,1,0,1,0,0,1,2,0,1],
                    [6,1,0,3,0,3,1,0,0,1],
                    [6,1,1,1,1,1,1,1,1,1],
                    [6,6,6,6,6,6,6,6,6,6],
                    [6,6,6,6,6,6,6,6,6,6],
        ]
        posX = 7
        posY = 6
    
    img = pygame.image.load("Perso%sDown.png" % Perso )
  
    while End() != 1 and Reset != 1:
        for event in pygame.event.get():
            if event.type == pygame.QUIT: sys.exit()
        screen.fill(black)
        reset  = 0    
        dispmap(themap,tiles)  
    
        screen.blit(img,(posX*larg,posY*larg) )
        keys = pygame.key.get_pressed()
        if lvl == 0 and getMap(3,3)==4:
            lvl = - 2
            Reset = 1
        elif lvl == 0 and getMap(3,7)==4:
            lvl = 0
            Reset = 1
            
            
        if lvl == -1 and getMap(2,6)==4:
            Perso = 1
            lvl = -1
            Reset = 1
        elif lvl == -1 and getMap(3,6)==4:
            Perso = 2
            lvl = -1
            Reset = 1
        elif lvl == -1 and getMap(4,6)==4:
            Perso = 3
            lvl = -1
            Reset = 1
        elif lvl == -1 and getMap(5,6)==4:
            Perso = 4
            lvl = -1
            Reset = 1
        elif lvl == -1 and getMap(6,6)==4:
            Perso = 5
            lvl = -1
            Reset = 1
            
            

            
        if (keys[K_LEFT] and not keys_old[K_LEFT]):
            img = pygame.image.load("Perso%sLeft.png"%Perso)
            if ani == 2 :
                if testCol(posX - 1 ,posY):
                    posX = posX -1
            if ani != 2 :
                ani = 2
                    
        if (keys[K_RIGHT] and not keys_old[K_RIGHT]):
            img = pygame.image.load("Perso%sRight.png"%Perso) 
            if ani == 3 :
                if testCol(posX +1,posY  ):        
                    posX = posX +1
            elif ani != 3 :
                ani = 3                

        if (keys[K_DOWN] and not keys_old[K_DOWN]):
            img = pygame.image.load( "Perso%sDown.png" % Perso ) 
            if ani == 1 :
                if testCol(posX ,posY +1 ):
                    posY = posY + 1
            elif ani != 1 :
                ani = 1  
                
                
        if (keys[K_UP] and not keys_old[K_UP]):
            img = pygame.image.load("Perso%sUp.png"%Perso) 
            if ani == 4 :
                if testCol(posX ,posY -1 ):        
                    posY = posY - 1
            elif ani != 4 :
                ani = 4                

        if (keys[K_SPACE] and not keys_old[K_SPACE]):
            Reset = 1
            lvl = lvl - 1 
        
        if (keys[K_LALT] and not keys_old[K_LALT]):
            Push(posX,posY,ani)
    
    
        keys_old = keys
        pygame.display.flip()
    Reset = 0
    lvl = lvl +1
    print(lvl)







themap =  [ [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
            [6,6,6,6,6,6,6,6,6,6],
        ]
