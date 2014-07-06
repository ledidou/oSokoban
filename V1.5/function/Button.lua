function Button(ecran,X,Y,image,texte,color)

lX=Image.width(image) 
lY=Image.height(image)
X2=lX+X
Y2=lX+X
screen.blit(ecran,X,Y,image)
screen.print(ecran, X+2,Y+5,texte,color)

end