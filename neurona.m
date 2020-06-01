function [nt_out] = neurona(y)

%Variables dadas por el PDF%%%%%%%%%%%%
beta = 2.5;
theta = 0.2;
Kr = 3;
max_count = 24;
delta_t = 1;
count1 = ceil(beta/(delta_t * theta));
count2 = count1;
salida = 0;
nt_out = 0:0;
t_span = 800;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 1;
while(t <= t_span)
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
    
    t = t + delta_t;
end

end
