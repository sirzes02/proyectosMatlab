close all
clear all
clc
close all
texto = input('ingrese un texto\n','s');

descri = {texto};

i=1;
sizetext = 20;
tamano=get(0,'ScreenSize');
Paltura=tamano(3);
Panchura=tamano(4);

while i <= length(texto)
    close
    figure,
    set(gcf,'position',[(Paltura-500)/2 (Panchura-100)/2 length(texto)*sizetext 100]),text(0,0.5,descri{1}(1:i),'Fontsize',sizetext),axis off;
    drawnow
    i = i+1;
end
