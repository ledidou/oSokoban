from pprint import pprint

convert = {1 : 6, 
           8 : 1, 
           2 : 0, 
           7 : 0}

def read( filename ) :
    
    x = 0
    themap = []
    lines = file(filename).readlines()
    for line in lines :
        line = line.rstrip()
        values = []
        y = 0
        for cell in line.split('|') :
            value = int(cell)
            
            if value == 7 : 
                posX = x
                posY = y 
                # spawn
                v = 0
            elif value == 1 : 
                # hors map
                v = 6
            elif value == 8 : 
                # mur
                v = 1
            elif value == 2 :
                # sol 
                v = 0
            elif value == 3 :
                # diamant 
                v = 2
            elif value == 5 : 
                # cible
                v = 3
            else : 
                print "ERROR value unexpected : %s" % value
                
            values.append( v )
            
            y = y + 1 
        themap.append( values )
    
        x = x + 1
    
    return themap, (posX, posY)    
        

if __name__ == "__main__" : 
    themap, spawn =  read( "../V1.5/map/monde1/map1.map" )
    
    pprint( themap )
    print spawn
