close all
clear
clc

I = imread('cameraman.tif');

intervalo = 20;
umbral = 0;
step = 0.1;
correr = 1;

tic
elapsed_time = toc;

while elapsed_time < intervalo
    close
    
    if round(umbral*100000)/100000 == 1
        correr = 0;
    elseif umbral == 0
        disp("umbral 0");
        correr = 1;
    end
    
    if correr == 1
        umbral =  umbral + step;
    else
        umbral = umbral - step;
    end
    
    BW = imbinarize(I,umbral);
    figure
    imshow (BW);
    drawnow
    
    elapsed_time = toc;
end