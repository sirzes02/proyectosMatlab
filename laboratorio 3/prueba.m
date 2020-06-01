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
    a = input("Ingrese un valor entre 0 y 1: ");
    if(a >= 0 && a <= 1)
        break;
    else
        disp("Error, ingrese un valor correcto.");
    end
end

for i = 1:tamanio
    if(vectorTiempo(i) < 20)
        s(i) = 0;
    else
        s(i) = a;
    end
end

count2_1 = count2;
count1_1 = count1;
nt_out_1 = nt_out;

t = 1;
while(t <= t_span)
    [count1_1, count2_1, nt_out_1] = neuraFinal(beta, theta, Kr,...
        max_count, delta_t, count1_1, count2_1, y, salida, nt_out_1, s, t);
    
    t = t + delta_t;
end

plot(nt_out_1);