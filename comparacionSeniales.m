clear;
clc;

fs = 100;
t = 0:1 / fs:10 - 1 / fs;
x = sin(2*pi*15*t) + sin (2*pi*40*t);

[fft1, f01] = caculafft(x, fs);

n = length(x);
f1 = (0:n - 1) * (fs / n);

burg1 = pburg(x, 8, f1, fs);

nfft = 128;
window = hanning(nfft);

[pxx, F] = calc_psd(x, nfft, fs, window);

ofac = 4;
hifac = 1;

[f, dep4, prob] = lomb(t, x, ofac, hifac);

figure

subplot(2, 2, 1), plot(f01, 10 * log10(fft1));
xlabel("Frecuencia en (Hz)");
ylabel("Potencia (W)");
xlim([0 fs/2]);
title("Densidad espectral de potencia (FFT transformada rapida de fourier)");

subplot(2, 2, 2), plot(f1, 10 * log10(burg1));
xlabel("Frecuencia en (Hz)");
ylabel("Potencia (W)");
xlim([0 fs/2]);
title("Densidad espectral de potencia (Burg)");

subplot(2, 2, 3), plot(F, pxx);
xlabel("Frecuencia en (Hz)");
ylabel("Potencia (W)");
title("Densidad espectral de potencia (Welch)");

subplot(2, 2, 4), plot(f, dep4);
xlabel("Frecuencia en (Hz)");
ylabel("Potencia (W)");
title("Densidad espectral de potencia (Lomb-Scargle)");

