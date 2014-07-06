function ResetLevel(niveau,map)
map = ScrollMap.new(tiles,"map/monde"..monde.."/map" .. niveau .. ".map", 15, 12, 16, 16) 
X,Y = SetMapProp(map)
Score=0
return map,X,Y
end

function NextLevel(niveau,map,menu_retour)
temp:stop()
retour=0
tempmonde=tempmonde+temp:time()
HightScore = INI.load("Score/monde"..monde.."/HightScore.ini")
HightScoreNiveau=tonumber(HightScore["map"..niveau-1]["Hightscore"])
    
    HightScoreNiveauTime = DateTime.new()
    HightScoreNiveauTime.hour = math.floor(HightScoreNiveau / 3600000)
    HightScoreNiveauTime.minute = math.floor(HightScoreNiveau / 60000%60)
    HightScoreNiveauTime.second = math.floor(HightScoreNiveau / 1000%60)
    HightScoreNiveauTime.millisecondes = HightScoreNiveau - HightScoreNiveauTime.hour * 3600000 - HightScoreNiveauTime.minute * 60000 - HightScoreNiveauTime.second * 1000
    
    ScoreNiveau = DateTime.new()
    ScoreNiveau.hour = math.floor(temp:time() / 3600000)
    ScoreNiveau.minute = math.floor(temp:time() / 60000%60)
    ScoreNiveau.second = math.floor(temp:time() / 1000%60)
    ScoreNiveau.millisecondes = temp:time() - ScoreNiveau.hour * 3600000 - ScoreNiveau.minute * 60000 - ScoreNiveau.second * 1000
    Sound.startSFX(0)
while retour==0 do
    Controls.read()
    screen.blit(SCREEN_UP, 0, 0, up)
    screen.blit(SCREEN_DOWN, 0, 0, down_menu)
    Button(SCREEN_DOWN,200,165,button_retour,"",jaune)
    StylusX=0
    StylusY=0
    
    screen.print(SCREEN_DOWN, 10,30,"Mon score = "..ScoreNiveau.minute.."min"..ScoreNiveau.second.."s"..ScoreNiveau.millisecondes.."ms")
    screen.print(SCREEN_DOWN, 10,20,"Niveau = "..niveau-1,jaune)
    if HightScoreNiveau>temp:time() and creation==0 then
        HightScore["map"..niveau-1]["Hightscore"]=tostring(temp:time())
        INI.save("Score/monde"..monde.."/HightScore.ini",HightScore)
        screen.print(SCREEN_DOWN, 10,40,"Nouveau record sur la map")
    elseif creation ==1 then
        screen.print(SCREEN_DOWN, 10,50,"Mode triche activer pas de Hight-score")
    else
        screen.print(SCREEN_DOWN, 10,40,"Hight score = "..HightScoreNiveauTime.minute.."min"..HightScoreNiveauTime.second.."s"..HightScoreNiveauTime.millisecondes.."ms")
    end
    
    if Stylus.newPress then
    StylusX = Stylus.X
    StylusY = Stylus.Y
    end
    if ButtonPress(200,165,button_retour,StylusX,StylusY) then
        retour=1
    end
    render()
end
if niveau==11 then
    niveau=1
    game=0
    menu=4
    if creation==0 then
        tempmondetotal = DateTime.new()
        tempmondetotal.hour = math.floor(tempmonde / 3600000)
        tempmondetotal.minute = math.floor(tempmonde / 60000)
        tempmondetotal.second = math.floor(tempmonde / 1000%60)
        tempmondetotal.millisecondes = tempmonde - tempmondetotal.hour * 3600000 - tempmondetotal.minute * 60000 - tempmondetotal.second * 1000
        HightScore["monde"]["tempmonde"]=(tempmondetotal.minute.."min"..tempmondetotal.second.."s"..tempmondetotal.millisecondes.."ms")
        option["jeu"]["monde"..monde]=tostring(2)
        option["jeu"]["monde"..monde+1]=tostring(1)
        INI.save("Score/monde"..monde.."/HightScore.ini",HightScore)
        INI.save("option/systeme.ini",option)
    end
end
map = ScrollMap.new(tiles,"map/monde"..monde.."/map" .. niveau .. ".map", 15, 12, 16, 16)
temp:reset()
temp:start()
X,Y = SetMapProp(map)
Score=0
return map,X,Y
end