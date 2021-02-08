
clc;
clear
samples = 20;
tc =linspace(0,1,samples)
for i = 1:samples
k = -457/(300*(tc(i)*564 +73));
PID = k*(tf([1],[1])+tf([1/457],[1,0])+tf([113.5 0],[1]));
sensor = tf([1],[10,1]);
ac = tf([-307.4],[4.841*10^6 88760 527 1]);
G=PID*sensor*ac;
[Gm,Pm,Wcg,Wcp] = margin(G);
GM(i) = Gm;
PM(i) = Pm;
end



figure;
subplot(2,1,1)
plot(tc,GM,'r')
grid on; grid minor;
title('Gm in Tc domin')
ylabel('GM(db) ');
xlabel('Tc(Tdom)');
subplot(2,1,2)
plot(tc,PM,'k')
grid on; grid minor;
title('Pm in Tc domin')
ylabel('pm ');
xlabel('Tc(Tdom)');
























