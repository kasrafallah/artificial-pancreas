%%
%freQ
sys1 = tf([-300],[247,1],'InputDelay',11);
sys2 = tf([1],[26,1]);
system_IP = sys1*sys2
figure;
bode(system_IP,'k')
title('bode diagram of SC &IP to  IP')
grid on;grid minor;
hold on
sys1 = tf([-307.35],[247,1],'InputDelay',73);
sys2 = tf([1],[210,1]);
system_SC = sys1*sys2
hold on
bode(system_SC,'r');
legend('IP',"SC")
%%
%time domine
sys1 = tf([-300],[247,1],'InputDelay',11);
sys2 = tf([1],[26,1]);
system_IP = sys1*sys2
figure;
subplot(2,1,1);
step(system_IP,'k')
title('step response to  IP')
grid on;grid minor;
xlim([0,2000])
sys1 = tf([-300],[247,1]);
sys2 = tf([1],[17,1]);
system_IP = sys1*sys2*sys2;
hold on
step(system_IP,'r--');
legend('third order','second order');

S = stepinfo(system_IP)
sys1 = tf([-307.35],[247,1],'InputDelay',73);
sys2 = tf([1],[210,1]);
system_SC = sys1*sys2
subplot(2,1,2);
step(system_SC,'k')
title('step response to  SC')
grid on;grid minor;
hold on
sys1 = tf([-307.35],[247,1]);
sys2 = tf([1],[140,1]);
system_SC = sys1*sys2*sys2;
step(system_SC,'r--')
S = stepinfo(system_IP)

