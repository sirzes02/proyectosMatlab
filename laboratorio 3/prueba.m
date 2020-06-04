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

% Ecuaciones del Neurodide->  Como aplicar? que es positivo y que se resta?
% (nt_out)
%   N1 = input - N3
%   N2 = input - N1
%   N3 = input - N2
%   input = nt_out?

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
salida = 0;
t_span = 200;%Mermado segun ejemplo del profesor

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
count1_3 = 0;
count2_3 = 0;
salida_3 = 0;
y_1 = 0;
y_2 = 0;
y_3 = 0;
nt_out_1 = 0;
nt_out_2 = 0;
nt_out_3 = 0;
%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ciclo de llamado
t = 1;
while(t <= t_span)
    % La ecuación? -> donde?
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [count1_1, count2_1, salida_1, y_1, nt_out_1] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_3, count2_3, y_1, salida_3,...
        nt_out_1, s, t);
    %count1 - count1_3, count1 - count2_3, salida - salida_3?
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [count1_2, count2_2, salida_2, y_2, nt_out_2] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_1, count2_1, y_2, salida_1,...
        nt_out_2, s, t);
    %count1 - count1_1, count1 - count2_1, salida - salida_1?
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [count1_3, count2_3, salida_3, y_3, nt_out_3] = neuraFinal(BETA,...
        THETA, KR,MAX_COUNT, DELTA_T, count1_2, count2_2, y_3, salida_2,...
        nt_out_3, s, t);
    %count1 - count1_2, count1 - count2_2, salida - salida_2?
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t = t + DELTA_T;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%
% Ecuaciones
N1 = y_1 - nt_out_3;
N2 = y_2 - nt_out_1;
N3 = y_3 - nt_out_2;
%%%%%%%%%%%%%%%%%%%%%%%%%

%Punto 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3, 2, 1), plot(y_1), title("Salida de y-1"),...
    subplot(3, 2, 2), plot(N1), title("Neuroide 1 (N1)"),...
    subplot(3, 2, 3), plot(y_2), title("Salida de y-2"),...
    subplot(3, 2, 4), plot(N2), title("Neuroide 2 (N2)"),...
    subplot(3, 2, 5), plot(y_3), title("Salida de y-3"),...
    subplot(3, 2, 6), plot(N3), title("Neuroide 3 (N3)");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
