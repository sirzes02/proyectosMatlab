function [] = practica_3_code()
clear
clc

beta = 2.5;
theta = 0.2;
Kr = 3;
max_count = 24;
delta_t = 1;
count1 = ceil(beta/(delta_t * theta));
count2 = count1;
t_span = 800;
y = 0:0;
salida = 0;
nt_out = 0:0;

%Variables
vectorTiempo = 1:delta_t:t_span;
a = 0;
s = 0:0;
tamanio = ((t_span - 1) / delta_t) + 1;

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

t = 1;
while(t <= t_span)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(s(t) < theta)
        y(t) = 0;
    else
        if(s(t) == theta)
            if(count1 >= beta/(s(t) * delta_t))
                y(t) = 1;
                count1 = 0;
            else
                y(t) = 0;
            end
        else
            if(count1 >= beta/((s(t) + theta) * delta_t))
                y(t) = 1;
                count1 = 0;
            else
                y(t) = 0;
                count1 = count1 + 1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (y(t) == 1)
        salida = Kr/(count2 * delta_t);
        nt_out(t) = salida;
        count2 = 0;
    else
        count2 = count2 + 1;
        if (max_count > count2 * delta_t)
            nt_out(t) = salida;
        else
            nt_out(t) = 0;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t = t + delta_t;
end

subplot(1, 2, 1), plot(vectorTiempo, y), subplot(1, 2, 2),...
    plot(vectorTiempo, nt_out);

end
