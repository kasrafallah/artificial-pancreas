clc;
clear;
samples = 5;
tc =[.1,.3,.5,.7,.9];
Ts =10;
k = -0.004188;
a = [];
AM = 50;
figure;
for i=1 : samples
k = -457/(300*(tc(i)*564 +73));
PID = k*(tf([1],[1])+tf([1/457],[1,0])+tf([113.5 0],[1]));
sensor = tf([1],[10,1]);
ac = tf([-245.88],[247,1])*tf([1],[210,1],'inputDelay',73)
G=PID*sensor*ac;
%sens(i)= getPeakGain()
hold on
nyquist(G)
%title(['tc = ',num2str(tc(i)),' sensitivity = ',num2str(sens(i))])
pause(0.005);legend('.1tdom','.3tdom','.5tdom','.7tdom','.9tdom')
grid on; grid minor;
end
figure;
for i=1 : samples
k = -457/(300*(tc(i)*564 +73));
PID = k*(tf([1],[1])+tf([1/457],[1,0])+tf([113.5 0],[1]));
sensor = tf([1],[10,1]);
ac = tf([-245.88],[247,1])*tf([1],[210,1],'inputDelay',73)
G=PID*sensor*ac;
%sens(i)= getPeakGain()
hold on
bode(1/(1+G))
%title(['tc = ',num2str(tc(i)),' sensitivity = ',num2str(sens(i))])
pause(0.005);legend('.1tdom','.3tdom','.5tdom','.7tdom','.9tdom')
grid on; grid minor;
end
for i = 1:samples
k = -457/(300*(tc(i)*564 +73));
PID = k*(tf([1],[1])+tf([1/457],[1,0])+tf([113.5 0],[1]));
sensor = tf([1],[10,1]);
ac = tf([-307.4],[4.841*10^6 88760 527 1]);
G=PID*sensor*ac;
sens(i)= getPeakGain(1/(1+G))
end

figure;
plot(tc,sens,'r')
grid on; grid minor;
title('sensitivity in Tc domin')
ylabel('sensitivity(db) ');
xlabel('Tc');

