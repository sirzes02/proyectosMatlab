% Neuroide
function [count1, count2, salida, y, nt_out] = neuraFinal(BETA, THETA,...
    KR, MAX_COUNT, DELTA_T, count1, count2, y, salida, nt_out, s, t)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrama 1
if(s(t) < THETA)
    y(t) = 0;
else
    if(s(t) == THETA)
        if(count1 >= BETA/(s(t) * DELTA_T))
            y(t) = 1;
            count1 = 0;
        else
            y(t) = 0;
        end
    else
        if(count1 >= BETA/((s(t) + THETA) * DELTA_T))
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
% Diagrama 2
if (y(t) == 1)
    salida = KR/(count2 * DELTA_T);
    nt_out(t) = salida;
    count2 = 0;
else
    count2 = count2 + 1;
    
    if (MAX_COUNT > count2 * DELTA_T)
        nt_out(t) = salida;
    else
        nt_out(t) = 0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
