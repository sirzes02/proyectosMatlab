clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beta = 2.5;
theta = 0.2;
delta_t = 1;
count1 = ceil(beta/(delta_t * theta));
count2 = count1;
nt_out = 0:0;
y = 0:0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T =  0 : 1/50e3 : 10e-3; 
D = [0 : 1/1e3 : 10e-3 ; 0.8.^(0:10)]'; 
s = pulstran(T, D, @gauspuls, 10E3, .5);

[count1_1, count2_1, y1, s1, nt_out1] = neurona1(count1, count2, y, s, nt_out);

[count1_2, count2_2, y2, s2, nt_out2] = neurona2(count1_1, count2_1, y1, s1, nt_out);

[count1_3, count2_3, y3, nt_out3] = neurona3(count2, count2_2, y2, s2, nt_out);

subplot(2, 2, 1), plot(y1), subplot(2, 2, 2), plot(y2), subplot(2, 2, 3), plot(y3), subplot(2, 2, 4), plot(s);
