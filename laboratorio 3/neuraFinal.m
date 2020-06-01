function [count1, count2, nt_out] = neuraFinal(beta, theta, Kr,...
    max_count, delta_t, count1, count2, y, salida, nt_out, s, t)

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

end
