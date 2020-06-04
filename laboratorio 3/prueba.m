clear
clc

% Parametros de salida por llamado a funcion -> count1_1, count2_1,
% salida_1, y_1, nt_out_1.

% Parametros de entrada por llamado a funcion -> beta, theta, Kr,
% max_count, delta_t, count1, count2, y, salida, nt_out, s, t.
%   beta: Valor dado como constante
%   theta: Valor dado como constante
%   Kr: Valor dado como constante
%   max_count: Valor dado como constante
%   delta_t: Valor dado como constante
%   count1: Parametro de salida tanto como entrada, variable entre llamada
%   count2: Parametro de salida tanto como entrada, variable entre llamada
%   y: Valor de imagen
%   salida: Parametro de salida tanto como entrada, variable entre llamada
%   nt_out: Parametro de salida tanto como entrada, variable entre llamada
%   s: Valor del tren de pulsos
%   t: Timpo (indexador de s)

% Ecuaciones del Neurodide  ->  Como aplicar? que se suma que se resta?
%   N1 = input - N3
%   N2 = N3 - N1
%   N3 = N2 - N2  ->  valor simpre 0?


% Punto 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BETA = 2.5;
THETA = 0.2;
KR = 3;
MAX_COUNT = 24;
DELTA_T = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
count1 = ceil(BETA/(DELTA_T * THETA));
count2 = count1;
y = 0:0;
salida = 0;
nt_out = 0:0;
t_span = 800;

vectorTiempo = 1:DELTA_T:t_span;
a = 0;
s = 0:0;
tamanio = ((t_span - 1) / DELTA_T) + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Punto 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(1)
    a = str2double(input("Ingrese un valor entre 0 y 1: ", 's'));
    
    if isempty(a)
        disp("Esta vacio, ingrese un valor correcto.");
    elseif isnan(a)
        disp("Ingrese un valor numerico correcto.");
    elseif a < 0 || a > 1
        disp("Ingrese un valor entre el rango de 0 - 1.");
    else
        break;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creacón del tren de pulsos
for i = 1:tamanio
    if(vectorTiempo(i) < 20)
        s(i) = 0;
    else
        s(i) = a;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%
% Inicialización de parametros
count1_1 = count1;
count2_1 = count2;
salida_1 = salida;
y_1 = y;
nt_out_1 = nt_out;
%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ciclo de llamado
t = 1;
while(t <= t_span)
    % Correcto? -> La ecuación? -> donde?
    [count1_1, count2_1, salida_1, y_1, nt_out_1] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_1, count2_1, y_1, salida_1,...
        nt_out_1, s, t);
    
    [count1_2, count2_2, salida_2, y_2, nt_out_2] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_1, count2_1, y_1, salida_1,...
        nt_out_1, s, t);
    
    [count1_3, count2_3, salida_3, y_3, nt_out_3] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_2, count2_2, y_2, salida_2,...
        nt_out_2, s, t);
    
    t = t + DELTA_T;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
% Ecuaciones
N1 = y - nt_out_2;
N2 = nt_out_3 - nt_out_1;
N3 = nt_out_2 - nt_out_2;
%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(3, 3, 1), plot(nt_out_1), title("Salida de nt-out-1"),...
    subplot(3, 3, 2), plot(y_1), title("Salida de y-1"),...
    subplot(3, 3, 3), plot(N1), title("Neuroide 1 (N1)"),...
    subplot(3, 3, 4), plot(nt_out_1), title("Salida de nt-out-2"),...
    subplot(3, 3, 5), plot(y_2), title("Salida de y-2"),...
    subplot(3, 3, 6), plot(N2), title("Neuroide 2 (N2)"),...
    subplot(3, 3, 7), plot(nt_out_1), title("Salida de nt-out-3"),...
    subplot(3, 3, 8), plot(y_1), title("Salida de y-3"),...
    subplot(3, 3, 9), plot(N3), title("Neuroide 3 (N3)");
