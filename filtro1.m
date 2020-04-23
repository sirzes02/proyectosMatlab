% La funci�n filtro1 construida a partir del toolbox de MatLab. Hay que
% tener en cuenta que los par�metros del filtro pueden variar dependiendo
% del tipo de se�al a filtrar. Asimismo, ocurre un desplazamiento en el
% tiempo como consecuencia del filtrado, lo cual no sucede cuando se usa la
% funci�n "filtro1.m"
function[filtrada]=filtro1(sin_filtrar)
% Varias opciones:
% butter
% cheby1
% cheby2
% ellip
% equiripple
% ifir
% kaiserwin
% multistage
% La mejor parece ser 'ifir', luego la 'equiripple' para se�ales de muy
% baja frecuencia y para las cuales se quiere filtrar ruido de 200-300 Hz
d = fdesign.lowpass('Fp,Fst,Ap,Ast',0.15,0.25,1,60);
Hd = design(d,'ifir');
% fvtool(Hd);                   % Grafica el filtro
filtrada = filter(Hd,sin_filtrar);            % Se�al filtrada, pero desplazada en el tiempo
end