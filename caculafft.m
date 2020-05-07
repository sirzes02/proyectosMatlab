% Función que calcula la DEP de una señal discreta
function [espectro,frec_base] = caculafft(senal, frec_muestreo)
n = length(senal);          % number of samples
% f = (0:n-1)*(frec_muestreo/n);     % frequency range
% power = abs(y).^2/n;    % power of the DFT
% Calculo el espectro usando la FFT...
DEP1 = fft(senal);
% y la centramos en cero
y0 = fftshift(DEP1);         % shift y values
frec_base = (-n/2:n/2-1)*(frec_muestreo/n); % 0-centered frequency range
espectro = abs(y0).^2/n;    % 0-centered power
end
