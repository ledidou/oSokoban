function changetiles(X,Y,direction,ID)  -- DEV tool
    if direction == 1 then
        ScrollMap.setTile(map,X/16,Y/16-1,ID)
    elseif direction == 2 then
        ScrollMap.setTile(map,X/16,Y/16+1,ID)
    elseif direction == 3 then
        ScrollMap.setTile(map,X/16-1,Y/16,ID)
    elseif direction == 4 then
        ScrollMap.setTile(map,X/16+1,Y/16,ID)
    end
end
