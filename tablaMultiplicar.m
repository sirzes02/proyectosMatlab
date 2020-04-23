function [] = tablaMultiplicar()
    num1 = input('Ingrese numero: ');
    resultado = 0;
    
    for i = 1: 10
        resultado = num1 + resultado;
        disp([num2str(num1), ' X ', num2str(i), ' = ', num2str(resultado), '.']);
    end
end