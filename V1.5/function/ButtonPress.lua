function ButtonPress(X,Y,image,StylusX,StylusY)
lX=Image.width(image) 
lY=Image.height(image)
X2=lX+X
Y2=lY+Y
if StylusX > X and StylusX < X2 and StylusY > Y and StylusY < Y2 then
    touche=true
    else
    touche=false
end
return touche
end