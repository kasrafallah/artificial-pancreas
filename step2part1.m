%%
sys1 = tf([-300],[247,1]);
sys2 = tf([1],[17,1]);
system_IP = sys1*sys2*sys2
figure;
subplot(2,1,1);
step(system_IP)
title('step response to  IP')
grid on;grid minor;
xlim([0,2000])
S = stepinfo(system_IP)
sys1 = tf([-307.35],[247,1]);
sys2 = tf([1],[140,1]);
system_SC = sys1*sys2*sys2;
subplot(2,1,2);
step(system_SC)
title('step response to  SC')
grid on;grid minor;
S = stepinfo(system_IP)
%%
sys1 = tf([-300],[247,1]);
sys2 = tf([1],[17,1]);
system_IP = sys1*sys2*sys2;
figure;
bode(system_IP)
grid on;grid minor;
sys1 = tf([-307.35],[247,1]);
sys2 = tf([1],[140,1]);
system_SC = sys1*sys2*sys2
hold on;
bode(system_SC)
title('bode diagram for IP & SC')
grid on;grid minor;
legend('IP','SC');