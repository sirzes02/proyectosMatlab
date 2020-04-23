function [resultado] = multiplicacionNumeros()
    num1 = input('Ingrese numero 1: ');
    num2 = input('Ingrese numero 2: ');
    resultado = 0;
    
    for i = 1: num2
        resultado = num1 + resultado;
    end
end