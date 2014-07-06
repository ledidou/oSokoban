function SetMapProp(map)
    ScoreFinal=0
    for i =1,15,1 do
        for j =1,11,1 do
            if ScrollMap.getTile(map,i,j)==7 then
                X=i*16
                Y=j*16
                ScrollMap.setTile(map,i,j,2)
            end
            if ScrollMap.getTile(map,i,j)==5 then
                ScoreFinal=ScoreFinal+1
            end
            
        end
    end
return X,Y
end