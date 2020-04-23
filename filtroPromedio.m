%autores: Catalina mendoza - 1193578869, Santiago Varela - 1005868161

% Declaración de función con retorno de imagen  y parametros de imagen,
% dimensiones, r y c

function [prom] = filtroPromedio(imagen, dimensiones, r, c)
disp("Procesando filtro promedio...");

% Se define prom como matriz
prom = [0;0];

% Recorrido de filas
for i = dimensiones + 1:r - dimensiones
    % Recorrido de columnas
    for j = dimensiones + 1:c - dimensiones
        % Definición y reinicio de a como 0
        a = 0;
        % Definición y reinicio de t como 0
        t = 0;
        % Recorrido de las filas externas al pixel
        for u = -dimensiones: dimensiones
            % Recorrido de las columnas externas al pixel
            for v = -dimensiones: dimensiones
                % Acumulador de suma de cada pixel externo al pixel (i j)
                a = a + imagen(i + u, j + v);
                % Aumento en t de 1
                t = t + 1;
            end
        end
        % Se le da la suma dividida la cantidad de pixeles al alrededos a
        % la posición del pixel de la imagen
        prom(i, j) = a / t;
    end
end

end