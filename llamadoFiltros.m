%autores: Catalina mendoza - 1193578869, Santiago Varela - 1005868161

% Declaración de función sin retorno con parametros de imagen y dimensiones
function [] = llamadoFiltros(imagen, dimensiones)
clc
disp("Procesando...");

% Conversión de imagen a double para el procesamiento
Dimagen = im2double(imagen);

% Obtener row, col de la imagen
[r, c] = size(Dimagen);

% Se verifica que simensiones sea impar
if(mod(dimensiones, 2) ~= 0)
    % Se verifica que dimensiones sea menor a 'r' y 'c'
    if(dimensiones <= r && dimensiones <= c)
        % Se imprime todas las imagenes en una misma ventana
        subplot(1, 3, 1), imshow(imagen), title('original'), ...
            subplot(1, 3, 2), ... 
            imshow(filtroPromedio(Dimagen, dimensiones, r, c)),...
            title('Con filtro promedio'), subplot(1, 3, 3),...
            imshow(filtroMediana(Dimagen, dimensiones, r, c)),...
            title('Con filtro mediana');
    else
        disp("La dimensión debe ser menor o igual al tamaño de la imagen");
    end
else
    disp("La dimensión debe ser impar");
end
end