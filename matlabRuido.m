num_ciclos = input('Ingrese # de ciclos');
suma_ciclo = zeros(1, tamano_ciclo);

for i = 1:num_ciclos
    suma_ciclo = suma_ciclo + ruidosa(1 + (i - 1) * tamano_ciclo:tamano_ciclo + (i - 1) * tamano_ciclo);
end

prom_ciclo = suma_ciclo./num_ciclos;
t_ciclo = 1:tamano_ciclo;
ciclo_ruidosa = ruidosa(1:tamano_ciclo);

figure, plot(t_ciclo, ciclo_ruidosa,':r','Linewidth',2);
hold on
plot(t_ciclo, prom_ciclo,'k','LineWidth', 2);
xlim([0 tamano_ciclo]);
hold off