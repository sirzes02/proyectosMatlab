clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta = 2.5;
theta = 0.2;
Kr = 3;
max_count = 24;
delta_t = 1;
count1 = ceil(beta/(delta_t * theta));
count2 = count1;
y = 0:0;
salida = 0;
nt_out = 0:0;
t_span = 800;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vectorTiempo = 1:delta_t:t_span;
a = 0;
s = 0:0;
tamanio = ((t_span - 1) / delta_t) + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

for i = 1:tamanio
    if(vectorTiempo(i) < 20)
        s(i) = 0;
    else
        s(i) = a;
    end
end

[count1_1, count2_1, y1, s1, nt_out1] = neurona1(count1, count2, y, s, ...
    nt_out);

[count1_2, count2_2, y2, s2, nt_out2] = neurona2(count1_1, count2_1, y1,...
    s1, nt_out1);

[count1_3, count2_3, y3, nt_out3] = neurona3(count2, count2_2, y2, s2,...
    nt_out2);

subplot(2, 2, 1), plot(nt_out1), subplot(2, 2, 2), plot(nt_out2), ...
    subplot(2, 2, 3), plot(nt_out3), subplot(2, 2, 4), plot(y1);

