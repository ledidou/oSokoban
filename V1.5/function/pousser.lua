function pousser(X,Y,direction,Score)
    if scanID(X,Y,direction)==3 and scanIDplus(X,Y,direction)==2 then--diamant->dalle
        if direction == 1 then
            ScrollMap.setTile(map,X/16,Y/16-1,2)
            ScrollMap.setTile(map,X/16,Y/16-2,3)
        end
        if direction == 2 then
            ScrollMap.setTile(map,X/16,Y/16+1,2)
            ScrollMap.setTile(map,X/16,Y/16+2,3)
        end
        if direction == 3 then
            ScrollMap.setTile(map,X/16-1,Y/16,2)
            ScrollMap.setTile(map,X/16-2,Y/16,3)
        end
        if direction == 4 then
            ScrollMap.setTile(map,X/16+1,Y/16,2)
            ScrollMap.setTile(map,X/16+2,Y/16,3)
        end
    end
    if scanID(X,Y,direction)==3 and scanIDplus(X,Y,direction)==5 then --diamant->socle
        if 	Rumble.isInserted() then
            Rumble.set(true)
        end
        if direction == 1 then
            ScrollMap.setTile(map,X/16,Y/16-1,2)
            ScrollMap.setTile(map,X/16,Y/16-2,4)
        end
        if direction == 2 then
            ScrollMap.setTile(map,X/16,Y/16+1,2)
            ScrollMap.setTile(map,X/16,Y/16+2,4)
        end
        if direction == 3 then
            ScrollMap.setTile(map,X/16-1,Y/16,2)
            ScrollMap.setTile(map,X/16-2,Y/16,4)
        end
        if direction == 4 then
            ScrollMap.setTile(map,X/16+1,Y/16,2)
            ScrollMap.setTile(map,X/16+2,Y/16,4)
        end
        Sound.startSFX(11)
        Score=Score+1        
    end
    if scanID(X,Y,direction)==6 and scanIDplus(X,Y,direction)==2 then -- caisse
        if direction == 1 then
            ScrollMap.setTile(map,X/16,Y/16-1,2)
            ScrollMap.setTile(map,X/16,Y/16-2,6)
        end
        if direction == 2 then
            ScrollMap.setTile(map,X/16,Y/16+1,2)
            ScrollMap.setTile(map,X/16,Y/16+2,6)
        end
        if direction == 3 then
            ScrollMap.setTile(map,X/16-1,Y/16,2)
            ScrollMap.setTile(map,X/16-2,Y/16,6)
        end
        if direction == 4 then
            ScrollMap.setTile(map,X/16+1,Y/16,2)
            ScrollMap.setTile(map,X/16+2,Y/16,6)
        end
    end
    
    if scanID(X,Y,direction)==4 and scanIDplus(X,Y,direction)==2 then  --enlever diamant socle
        if direction == 1 then
            ScrollMap.setTile(map,X/16,Y/16-1,5)
            ScrollMap.setTile(map,X/16,Y/16-2,3)
        end
        if direction == 2 then
            ScrollMap.setTile(map,X/16,Y/16+1,5)
            ScrollMap.setTile(map,X/16,Y/16+2,3)
        end
        if direction == 3 then
            ScrollMap.setTile(map,X/16-1,Y/16,5)
            ScrollMap.setTile(map,X/16-2,Y/16,3)
        end
        if direction == 4 then
            ScrollMap.setTile(map,X/16+1,Y/16,5)
            ScrollMap.setTile(map,X/16+2,Y/16,3)
        end
        Score=Score-1
    end
      if scanID(X,Y,direction)==4 and scanIDplus(X,Y,direction)==5 then  --
        if direction == 1 then
            ScrollMap.setTile(map,X/16,Y/16-1,5)
            ScrollMap.setTile(map,X/16,Y/16-2,4)
        end
        if direction == 2 then
            ScrollMap.setTile(map,X/16,Y/16+1,5)
            ScrollMap.setTile(map,X/16,Y/16+2,4)
        end
        if direction == 3 then
            ScrollMap.setTile(map,X/16-1,Y/16,5)
            ScrollMap.setTile(map,X/16-2,Y/16,4)
        end
        if direction == 4 then
            ScrollMap.setTile(map,X/16+1,Y/16,5)
            ScrollMap.setTile(map,X/16+2,Y/16,4)
        end
    end  
    
    
    
    
    
    
    if 	Rumble.isInserted() then
            Rumble.set(false)
    end
    return Score
end