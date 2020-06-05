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

% Ecuaciones del Neurodide.
%   N1 = input - N3
%   N2 = input - N1
%   N3 = input - N2

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
% Creación de pulso
for i = 1:t_span
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
count1_2 = count1;
count1_3 = count1;
count2_1 = count1;
count2_2 = count1;
count2_3 = count1;
salida_1 = 0;
salida_2 = 0;
salida_3 = 0;
y_1 = 0:0;
y_2 = 0:0;
y_3 = 0:0;
nt_out_1 = 0:0;
nt_out_2 = 0:0;
nt_out_3 = 0:0;
N1 = 0:0;
N2 = 0:0;
N3 = 0:0;
%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ciclo de llamado a las neuronas
t = 2;
while(t <= t_span)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N1(t) = s(t) - nt_out_3(t - 1);
    [count1_1, count2_1, salida_1, y_1(t), nt_out_1(t)] =...
        neuraFinal(BETA, THETA, KR, MAX_COUNT, DELTA_T, count1_1,...
        count2_1, salida_1, N1(t));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N2(t) = s(t) - nt_out_1(t);
    [count1_2, count2_2, salida_2, y_2(t), nt_out_2(t)] =...
        neuraFinal(BETA, THETA, KR, MAX_COUNT, DELTA_T, count1_2,...
        count2_2, salida_2, N2(t));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N3(t) = s(t) - nt_out_2(t);
    [count1_3, count2_3, salida_3, y_3(t), nt_out_3(t)] =...
        neuraFinal(BETA, THETA, KR, MAX_COUNT, DELTA_T, count1_3,...
        count2_3, salida_3, N3(t));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t = t + DELTA_T;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Punto 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3, 1, 1), plot(y_1), title("Salida de y-1"),...
    subplot(3, 1, 2), plot(y_2), title("Salida de y-2"),...
    subplot(3, 1, 3), plot(y_3), title("Salida de y-3");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
