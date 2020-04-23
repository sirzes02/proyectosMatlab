cuenta = 0;
j = 1;
umbral = 5;

for i = 2:length(y1)
    if y1(i) > y1(i - 1)
        cuenta = cuenta + 1;
    else
        if cuenta > umbral
            amp_pico(j) = y1(i - 1);
            t_pico(j) = tiempo(i - 1);
            j = j + 1;
        end
        cuenta = 0;
    end
end 

figure, plot(tiempo, y1);

hold on
plot(t_pico, amp_pico, 'or', 'markersize', 12);
xlim([0 length(y1)]);
hold off
