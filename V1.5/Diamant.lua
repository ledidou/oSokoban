option = INI.load("option/systeme.ini")
texture_pack=tonumber(option["texturepack"]["texturepack"])
texture_perso=tonumber(option["texturepack"]["perso"])


up = Image.load("Textures/Textures"..texture_pack.."/up.png", VRAM)
down = Image.load("Textures/Textures"..texture_pack.."/down.png", VRAM)

jaune = Color.new(31, 31, 0)
bleu = Color.new(0, 0, 31)
rouge = Color.new(31, 0, 0)
vert = Color.new(0, 31, 0)
orange = Color.new(31, 17, 0)
noir = Color.new(0, 0, 0)
blanc = Color.new(31, 31, 31)
jaune = Color.new(31, 31, 0)

button_vide=Image.load("textures/Textures"..texture_pack.."/menu/button_vide.png", VRAM)
button_retour =Image.load("textures/Textures"..texture_pack.."/menu/button_retour.png", VRAM)
down_menu = Image.load("textures/Textures"..texture_pack.."/Menu/down_menu.png", VRAM)

button_monde1=Image.load("textures/Textures"..texture_pack.."/Menu/menu_monde1.png", VRAM)
button_monde2=Image.load("textures/Textures"..texture_pack.."/Menu/menu_monde2.png", VRAM)
button_monde3=Image.load("textures/Textures"..texture_pack.."/Menu/menu_monde3.png", VRAM)
button_monde2ver=Image.load("textures/Textures"..texture_pack.."/Menu/monde2bloquer.png", VRAM)
button_monde3ver=Image.load("textures/Textures"..texture_pack.."/Menu/monde3bloquer.png", VRAM)




menu_retour = {}
menu_retourX=200
menu_retourY=165

menu_skin_bloquer=Image.load("textures/Textures"..texture_pack.."/skin_perso_bloquer.png", VRAM)
button_skin1=Image.load("textures/Perso1/skin_perso.png", VRAM)
button_skin2=Image.load("textures/Perso2/skin_perso.png", VRAM)
button_skin3=Image.load("textures/Perso3/skin_perso.png", VRAM)
button_skin4=Image.load("textures/Perso4/skin_perso.png", VRAM)

Sound.loadBank("Son/soundbank.bin")
Sound.loadMod(0)--zelda musique darkworld
Sound.loadSFX(0)--bruit applaud
Sound.loadSFX(11)--bruit 
Sound.loadMod(1)--zelda cave
Sound.loadMod(2)--zelda musique
son = 1
info = 0
creation = 0

game=0
i , j ,x,y= 0 , 0 , 0 , 0
Score=0
Tool=1
ScoreFinal = 3
direction = 1
move = false
pixel = 0
ID = 0
devant=0
temp = Timer:new()
niveau=1
monde=1

if Rumble.isInserted() then
rumble="Brancher"
else rumble="Off" end

local perso = {}
perso["X"]=0
perso["Y"]=0
perso["direction"]=2
walk = {}
walk[2] = true  -- Dalles
walk[1] = true --herbe
walk[3] = false  --Diamant
walk[4] = false --Diamant rouge
walk[5] = true -- socle diamant
walk[6] = false --Caisse
walk[7] = true -- Spawn
walk[8] = false -- Mur
walk[9] = true --sol rugeu
menu=0
dofile("function/scan.lua")
dofile("function/pousser.lua")
dofile("function/changetiles.lua")
dofile("function/SetMapProp.lua")
dofile("function/Level.lua")
dofile("function/ButtonPress.lua")
dofile("function/Button.lua")

while not Stylus.newPress do
Controls.read()
screen.blit(SCREEN_UP, 0, 0, up)
screen.blit(SCREEN_DOWN, 0, 0, down)
render()
end
Fin=0
Sound.startMod(0, PLAY_LOOP)
menu=0
option = INI.load("option/systeme.ini")
while Fin==0 do
temp:reset()
temp:stop()
niveau=1
while menu==0 or menu==2 or menu==4 or menu==5 do
Controls.read()
screen.blit(SCREEN_UP, 0, 0, up)
screen.blit(SCREEN_DOWN, 0, 0, down_menu)
StylusX=0
StylusY=0

if Stylus.newPress then
    StylusX = Stylus.X
    StylusY = Stylus.Y
end
if info==1 then

    screen.print(SCREEN_UP, 10,30,"Son = "..son)
    screen.print(SCREEN_UP, 10,40,"Triche = "..creation)
    screen.print(SCREEN_UP, 10,10,"Stylus X = "..x)
    screen.print(SCREEN_UP, 10,20,"Stylus Y = "..y)
end

if menu==0 then

    Button(SCREEN_DOWN,3,65,button_vide,"Lancer jeu",jaune)
    Button(SCREEN_DOWN,3,95,button_vide,"Bonus",jaune)
    Button(SCREEN_DOWN,3,125,button_vide,"Option",jaune)
    Button(SCREEN_DOWN,3,155,button_vide,"Quitter",jaune)
 
    if ButtonPress(3,65,button_vide,StylusX,StylusY) then
        menu=4
    end 
    if ButtonPress(3,95,button_vide,StylusX,StylusY) then
        menu=5
    end
    if ButtonPress(3,125,button_vide,StylusX,StylusY) then
        menu=2
    end
    if ButtonPress(3,155,button_vide,StylusX,StylusY) then
        menu=3
        game=0
        Fin=1
    end
    StylusX=0
    StylusY=0
end
if menu==2 then

    if son == 1 then
        Button(SCREEN_DOWN,3,70,button_vide,"Son = ON",jaune)
        else
        Button(SCREEN_DOWN,3,70,button_vide,"Son = OFF",jaune)
    end
    
    if info == 1 then
        Button(SCREEN_DOWN,3,110,button_vide,"Info = ON",jaune)
        else
        Button(SCREEN_DOWN,3,110,button_vide,"Info = OFF",jaune)
    end
    
    if creation == 1 then
        Button(SCREEN_DOWN,3,150,button_vide,"Triche = ON",jaune)
        else
        Button(SCREEN_DOWN,3,150,button_vide,"Triche = OFF",jaune)
    end
    
    Button(SCREEN_DOWN,200,165,button_retour,"",jaune)
    
    if ButtonPress(3,70,button_vide,StylusX,StylusY) then
        if son == 1 then
            son=0 
            Sound.setModVolume(0)
        else
            son=1
            Sound.setModVolume(1024)
        end
    end
    if ButtonPress(3,110,button_vide,StylusX,StylusY) then
        if info == 1 then
            info=0
        else info=1
        end
    end       
    if ButtonPress(3,150,button_vide,StylusX,StylusY) then
        if creation == 1 then
            creation=0
        else creation=1
        end
    end 
    if ButtonPress(200,165,button_retour,StylusX,StylusY) then
        menu=0
    end
    StylusX=0
    StylusY=0
    
end 
if menu==4 then

    if tonumber(option ["jeu"]["monde1"])==0 and creation==0 then
        Button(SCREEN_DOWN,5,40,button_monde1,"Bloque",rouge)
    elseif tonumber(option ["jeu"]["monde1"])==1 and creation==0 then
        Button(SCREEN_DOWN,5,40,button_monde1,"Nouveau",jaune)
    elseif tonumber(option ["jeu"]["monde1"])==2 and creation==0 then
        Button(SCREEN_DOWN,5,40,button_monde1,"Fini",vert)
        HightScore = INI.load("Score/monde1/HightScore.ini")
        screen.print(SCREEN_DOWN,10,72,HightScore["monde"]["tempmonde"])
    elseif creation==1 then
        Button(SCREEN_DOWN,5,40,button_monde1,"triche",rouge)
    end
    screen.print(SCREEN_DOWN, 5,30,"Monde 1")    
    
    if tonumber(option ["jeu"]["monde2"])==0 and creation==0 then
        Button(SCREEN_DOWN,90,40,button_monde2ver,"Bloque",rouge)
    elseif tonumber(option ["jeu"]["monde2"])==1 and creation==0 then
        Button(SCREEN_DOWN,90,40,button_monde2,"Nouveau",jaune)
    elseif tonumber(option ["jeu"]["monde2"])==2 and creation==0 then
        Button(SCREEN_DOWN,90,40,button_monde2,"Fini",vert)
        HightScore = INI.load("Score/monde2/HightScore.ini")
        screen.print(SCREEN_DOWN, 95,72,HightScore["monde"]["tempmonde"])
    elseif creation==1 then
        Button(SCREEN_DOWN,90,40,button_monde2,"triche",rouge)
    end
    screen.print(SCREEN_DOWN, 90,30,"Monde 2")   
    
    if tonumber(option ["jeu"]["monde3"])==0 and creation==0 then
        Button(SCREEN_DOWN,175,40,button_monde3ver,"Bloque",rouge)
    elseif tonumber(option ["jeu"]["monde3"])==1 and creation==0 then
        Button(SCREEN_DOWN,175,40,button_monde3,"Nouveau",jaune)
    elseif tonumber(option ["jeu"]["monde3"])==2 and creation==0 then
        Button(SCREEN_DOWN,175,40,button_monde3,"Fini",vert)
        HightScore = INI.load("Score/monde3/HightScore.ini")
        screen.print(SCREEN_DOWN, 180, 72,HightScore["monde"]["tempmonde"])
    elseif creation==1 then
        Button(SCREEN_DOWN,175,40,button_monde3,"triche",rouge)
    end
    screen.print(SCREEN_DOWN,175,30,"Monde 3")
    
    Button(SCREEN_DOWN,200,165,button_retour,"",jaune)
    
    if ButtonPress(5,40,button_monde1,StylusX,StylusY) and (tonumber(option ["jeu"]["monde1"])>=1 or creation==1) then
        game=1
        menu=1
        monde=1
        Sound.startMod(0, PLAY_LOOP)
    end
    if ButtonPress(90,40,button_monde2,StylusX,StylusY) and (tonumber(option ["jeu"]["monde2"])>=1 or creation==1) then
        game=1
        menu=1
        monde=2
        Sound.startMod(1, PLAY_LOOP)
    end 
    if ButtonPress(175,40,button_monde3,StylusX,StylusY) and (tonumber(option ["jeu"]["monde3"])>=1 or creation==1) then
        game=1
        menu=1
        monde=3
        Sound.startMod(2, PLAY_LOOP)
    end 
    if ButtonPress(200,165,button_retour,StylusX,StylusY) then
        menu=0
    end
    
    StylusX=0
    StylusY=0
end
if menu==5 then

    Button(SCREEN_DOWN,200,165,button_retour,"",jaune)   
    Button(SCREEN_DOWN,100,10,button_skin1,"",jaune)
    if tonumber(option ["jeu"]["monde1"])==2 then
        Button(SCREEN_DOWN,25,80,button_skin2,"",jaune)
    else 
        Button(SCREEN_DOWN,25,80,menu_skin_bloquer,"",jaune)
    end
    if tonumber(option ["jeu"]["monde2"])==2 then
        Button(SCREEN_DOWN,100,80,button_skin3,"",jaune)
    else 
        Button(SCREEN_DOWN,100,80,menu_skin_bloquer,"",jaune)
    end
    if tonumber(option ["jeu"]["monde3"])==2 then
        Button(SCREEN_DOWN,175,80,button_skin4,"",jaune)
    else 
        Button(SCREEN_DOWN,175,80,menu_skin_bloquer,"",jaune)
    end
    if ButtonPress(100,10,button_skin1,StylusX,StylusY) then
        option["texturepack"]["perso"]=tostring(1)
        Sound.startSFX(11)
        INI.save("option/systeme.ini",option)
    end
    if ButtonPress(25,80,button_skin2,StylusX,StylusY) and tonumber(option ["jeu"]["monde1"])==2 then
        option["texturepack"]["perso"]=tostring(2)
        Sound.startSFX(11)
        INI.save("option/systeme.ini",option)
    end
    if ButtonPress(100,80,button_skin3,StylusX,StylusY) and tonumber(option ["jeu"]["monde2"])==2 then
        option["texturepack"]["perso"]=tostring(3)
        Sound.startSFX(11)
        INI.save("option/systeme.ini",option)
    end   
    if ButtonPress(175,80,button_skin4,StylusX,StylusY) and tonumber(option ["jeu"]["monde2"])==2 then
        option["texturepack"]["perso"]=tostring(4)
        Sound.startSFX(11)
        INI.save("option/systeme.ini",option)
    end  
    if ButtonPress(200,165,button_retour,StylusX,StylusY) then
        menu=0
    end
    
    StylusX=0
    StylusY=0
    
end

render()
end

texture_pack=tonumber(option["texturepack"]["texturepack"])
texture_perso=tonumber(option["texturepack"]["perso"])
tiles = Image.load("Textures/Textures"..texture_pack.."/Monde"..monde.."/tiles.png", VRAM)
tilesinfo = Sprite.new("Textures/Textures"..texture_pack.."/Monde"..monde.."/tiles.png",16,16,VRAM)
spr = Sprite.new("Textures/Perso"..texture_perso.."/sprite.png",16,20,VRAM)

map,perso.X,perso.Y=ResetLevel(niveau)
tempmonde=1
temp:start()
while game==1 do
    Controls.read()
    ScrollMap.draw(SCREEN_UP, map)
    spr:drawFrame(SCREEN_UP,perso.X,perso.Y-6,direction)
   
    temps = DateTime.new()
    temps.hour = math.floor(temp:time() / 3600000)
    temps.minute = math.floor(temp:time() / 60000%60)
    temps.second = math.floor(temp:time() / 1000%60)
    temps.millisecondes = temp:time() - temps.hour * 3600000 - temps.minute * 60000 - temps.second * 1000
    if info==0 then
    screen.print(SCREEN_DOWN, 10,20,"Niveau = "..niveau,jaune)
    screen.print(SCREEN_DOWN, 10, 40,"Temp = "..temps.hour.."h"..temps.minute.."min"..temps.second.."s"..temps.millisecondes.."ms")
    screen.print(SCREEN_DOWN,10,50,"Score = "..Score)
    screen.print(SCREEN_DOWN,10,60,"Diamant restant = "..ScoreFinal-Score)
    end
    if info==1 then
    screen.print(SCREEN_UP, 10,20,"Niveau = "..niveau,jaune)
    screen.print(SCREEN_DOWN, 10, 100, temps.hour.."h"..temps.minute.."min"..temps.second.."s"..temps.millisecondes.."ms")
    screen.print(SCREEN_DOWN,60,80,"Score = "..Score.."  Diamant restant = "..ScoreFinal-Score)
    
    screen.print(SCREEN_DOWN, 10,10,"perso.X =")
    screen.print(SCREEN_DOWN, 10,20,"perso.Y =")   
    screen.print(SCREEN_DOWN, 10,30,"Temp =")
    screen.print(SCREEN_DOWN, 10,45,"ID du sol =")
    screen.print(SCREEN_DOWN, 10,65,"ID devant =")
    screen.print(SCREEN_DOWN, 10,90,"Rumble=")
    
    screen.print(SCREEN_DOWN, 65,10,perso.X)
    screen.print(SCREEN_DOWN,65,20,perso.Y)
    screen.print(SCREEN_DOWN,60,30,temp:time())
    tilesinfo:drawFrame(SCREEN_DOWN,80,40,ID)
    screen.print(SCREEN_DOWN,100,45,ID)
    tilesinfo:drawFrame(SCREEN_DOWN,80,60,devant)
    screen.print(SCREEN_DOWN,100,65,devant)
    screen.print(SCREEN_DOWN,60,90,rumble)
    end
    if creation == 1 then
        screen.print(SCREEN_DOWN, 10, 115,"Tool =  "..Tool)
        tilesinfo:drawFrame(SCREEN_DOWN, 70, 110,Tool)
    end
    if move == false then
        ID = scanID(perso.X,perso.Y,0)
        devant=scanID(perso.X,perso.Y,direction)
    end
    if Keys.newPress.Select and move == false then
       Score=0
       map,perso.X,perso.Y=ResetLevel(niveau,map)
    end
    if Keys.newPress.Start then
       menu=0
       game=0
    end
    
    if Keys.newPress.X and move == false then
        Tool=Tool+1
    end
    if Keys.newPress.Y and move == false then
        Tool=Tool-1
    end
    if Keys.newPress.B and move == false and creation == 1 then 
        changetiles(perso.X,perso.Y,direction,Tool)
    end
    if Keys.newPress.A and move == false then
        Score=pousser(perso.X,perso.Y,direction,Score)
        end
    if Keys.newPress.R and creation==1 then
        Score=0
        niveau=niveau+1
        map,perso.X,perso.Y=NextLevel(niveau,map,menu_retour)
    end
    if Keys.held.Up and move == false then
        direction = 1
        if scanCol(perso.X,perso.Y,direction,walk) then
            pixel=0
            move = true
        end
    end
    
    if Keys.held.Down and move == false then
        direction = 2 
        if scanCol(perso.X,perso.Y,direction,walk) then
           pixel=0 
           move = true
        end
    end
    
    if Keys.held.Left and move == false then
        direction = 3 
        if scanCol(perso.X,perso.Y,direction,walk) then
            pixel=0
            move = true
        end
    end
    
    if Keys.held.Right and move == false then
        direction = 4
        if scanCol(perso.X,perso.Y,direction,walk) then
            pixel=0
            move = true
        end
    end
        if Score==ScoreFinal and move == false then
        Score=0
        niveau=niveau+1
        map,perso.X,perso.Y=NextLevel(niveau,map,menu_retour)
    end
    if move == true then
        if direction == 1 then
            perso.Y = perso.Y -2
            pixel=pixel+2
        end
        if direction == 2 then
            perso.Y = perso.Y +2
            pixel=pixel+2
        end       
        if direction == 3 then
            perso.X = perso.X -2
            pixel=pixel+2
        end
        if direction == 4 then
            perso.X = perso.X +2
            pixel=pixel+2
        end
        if pixel == 16 then move = false end
    end
    render()
end
Image.destroy(tiles)
tilesinfo:destroy()
spr:destroy()

end


ScrollMap.destroy(map)
map = nil

Image.destroy(up)
Image.destroy(down)

Image.destroy(button_vide)
Image.destroy(down_menu)
Image.destroy(button_monde1)
Image.destroy(button_monde2)
Image.destroy(button_monde3)
Image.destroy(button_monde2ver)
Image.destroy(button_monde3ver)

tiles = nil
down = nil
up = nil
spr = nil
perso = nil
direction = nil

colTable = nil

Score=nil
Tool=nil
ScoreFinal = nil
direction = nil
move = nil
pixel =nil
ID = nil
devant=nil
niveau=nil

game=nil
i , j ,x,y= nil , nil , nil , nil
temp = nil

son = nil
info = nil
creation = nil

Sound.unloadMod(0)
Sound.unloadSFX(1)
Sound.unloadSFX(11)
Sound.unloadBank()
Sound.stop()