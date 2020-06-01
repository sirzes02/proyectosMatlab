function [count1, count2, y, s, nt_out] = neurona1(count1, count2, y, s,...
    nt_out)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta = 2.5;
theta = 0.2;
Kr = 3;
max_count = 24;
delta_t = 1;
salida = 0;
t_span = 450;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 1;
while(t <= t_span)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    t = t + delta_t;
end

t = 1;
while(t <= t_span)
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

end
