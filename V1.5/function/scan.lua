function scanIDplus(X,Y,direction)
    if direction == 1 then
        id=ScrollMap.getTile(map,X/16,(Y/16)-2)
    elseif direction == 2 then
        id=ScrollMap.getTile(map,X/16,(Y/16)+2)
    elseif direction == 3 then
        id=ScrollMap.getTile(map,(X/16)-2,Y/16)
    elseif direction == 4 then
        id=ScrollMap.getTile(map,(X/16)+2,Y/16)
    end
    return id
end
function scanID(X,Y,direction)
    if direction == 0 then
        id=ScrollMap.getTile(map,X/16,Y/16)
    elseif direction == 1 then
        id=ScrollMap.getTile(map,X/16,(Y/16)-1)
    elseif direction == 2 then
        id=ScrollMap.getTile(map,X/16,(Y/16)+1)
    elseif direction == 3 then
        id=ScrollMap.getTile(map,(X/16)-1,Y/16)
    elseif direction == 4 then
        id=ScrollMap.getTile(map,(X/16)+1,Y/16)
    end
    return id
end
function scanCol(X,Y,direction,walk)
    colision=walk[scanID(X,Y,direction)]
    return colision
end
