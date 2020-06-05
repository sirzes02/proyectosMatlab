% Neuroide
function [count1, count2, salida, y, nt_out] = neuraFinal(BETA, THETA,...
    KR, MAX_COUNT, DELTA_T, count1, count2, salida, s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrama 1
if(s < THETA)
    y = 0;
else
    if(s == THETA)
        if(count1 >= BETA/(s * DELTA_T))
            y = 1;
            count1 = 0;
        else
            y = 0;
        end
    else
        if(count1 >= BETA/((s + THETA) * DELTA_T))
            y = 1;
            count1 = 0;
        else
            y = 0;
            count1 = count1 + 1;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrama 2
if (y == 1)
    salida = KR/(count2 * DELTA_T);
    nt_out = salida;
    count2 = 0;
else
    count2 = count2 + 1;
    
    if (MAX_COUNT > count2 * DELTA_T)
        nt_out = salida;
    else
        nt_out = 0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
