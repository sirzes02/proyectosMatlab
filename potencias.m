function [resultado] = potencias()
    num1 = input('Ingrese numero base: ');
    num2 = input('Ingrese numero exponente: ');
    resultado = 1;
    
    for i = 1: num2
        resultado = num1 * resultado;
    end
end