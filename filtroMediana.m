%autores: Catalina mendoza - 1193578869, Santiago Varela - 1005868161

% Declaración de función con retorno de imagen  y parametros de imagen,
% dimensiones, r y c

function [prom] = filtroMediana(imagen, dimensiones, r, c)
disp("Procesando filtro mediana...");

% Se define prom como matriz
prom = (r:c);

% Recorrido de filas
for x = dimensiones + 1:r - dimensiones
    % Recorrido de columnas
    for y = dimensiones + 1:c - dimensiones
        % Definición y reinicio de a como vector
        a = [0; 0];
        % Definición y reinicio de t como 0
        t = 1;
        % Recorrido de las filas externas al pixel
        for u = -dimensiones: dimensiones
            % Recorrido de las columnas externas al pixel
            for v = -dimensiones: dimensiones
                % Guardado de los puntos al rededor del pixel (x y)
                a(t) = imagen(x + u, y + v);
                % Aumento en t de 1
                t = t + 1;
            end
        end
        % Ordenado del vecto a
        a1 = sort(a);
        
        if mod(t, 2) == 0
            med = a1(fix(t/2));
        else
            med = a1(fix(t/2) + 1);
        end
        
        % Se le da el valor de la mediana a la posición del pixel de la
        % imagen
        prom(x, y) = med;
    end
end

end