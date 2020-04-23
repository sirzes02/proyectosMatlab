% La funci�n filtro2 construida a partir de un ejemplo disponible en: 
% https://www.mathworks.com/help/signal/ug/anti-causal-zero-phase-filter-implementation.html
% El filtro se porta bastante bien con se�ales de muy baja frecuencia y
% elimina ruido a partir de 200-300 Hz. Asimismo, compensa el desfase en tiempo
% que se genera tras filtrar la se�al original. Para ver m�s detalles es
% preciso consultar el v�nculo
function [filtrada]=filtro2(sin_filtrar)
b = ones(1,10)/10;
filtrada = filtfilt(b,1,sin_filtrar);
end