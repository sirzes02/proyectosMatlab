%Taller

%Constantes
DT = 1;
B = 2.4;
G = 0.2;

%Variables
vectorTiempo = 1:DT:200;
a = 0;
s = 0:0;
y = 0:0;
tamanio = ((200 - 1) / DT) + 1;
count1 = 0;

%PUNTO 1'
while(1)
    a = input("Ingrese un valor entre 0 y 1: ");
    if(a >= 0 && a <= 1)
        break;
    else
        disp("Error, ingrese un valor correcto.");
    end
end

%PUNTO 2
for i = 1:tamanio
    if(vectorTiempo(i) < 20)
        s(i) = 0;
    else
        s(i) = a;
    end
end

count1 = ceil(B/(G*DT));

%DIAGRAMA DE FLUJO
t = 1;
while(t <= tamanio)
    if(s(t) < G)
        y(t) = 0;
    else
        if(s(t) == G)
            if(count1 >= B/((s(t) + G) * DT))
                y(t) = 1;
                count1 = 0;
            else
                y(t) = 0;
            end
        else
            if(count1 >= B/(s(t) * DT))
                y(t) = 1;
                count1 = 0;
            else
                y(t) = 0;
                count1 = count1 + 1;
            end
        end
    end
    
    
    t = t + 1;
end

plot(vectorTiempo, y);