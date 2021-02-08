%%
clc;
clear;
samples = 4;
AM = 50;
tc =[.1,.3 .5 .7]*282
Ts =4;
k = -0.004188;
figure;
a = [];
for i=1 : samples
a = [a,[(tc(i)/282)]];
k = -457/(300*(tc(i) +73));
Ts =10;
sim('step4');
y = simout.data;
t = simout.Time;
hold on;
plot(t,y);
pause(0.005);
grid on; grid minor;
title('output of system after meal')
ylabel('blood glucose ');
xlabel('t(min)');
xlim([4000,5000]);
end
hold on;
plot(t,ones(1,length(t))*180,'g--.')
plot(t,ones(1,length(t))*70,'g--.')
plot(t,ones(1,length(t))*140,'c--')
plot(t,ones(1,length(t))*80,'c--')
legend(num2str(a'));

%%
system = linmod('step4')
system = ss(system.a,system.b,system.c,system.d)
h= tf(system)
figure
bode(h)

clc;
clear;
samples = 20;
tc =linspace(0,1000,samples);
Ts =4;
k = -0.004188;
figure;
a = [];
for i=1 : samples
a = [a,[(tc(i))]];
k = -457/(300*(tc(i) +73));
Ts =10;
system = linmod('step4')
system = ss(system.a,system.b,system.c,system.d)
h= tf(system);
hold on
bode(h)
pause(0.005);
grid on; grid minor;
title('output of system after meal')
ylabel('blood glucose ');
xlabel('t(min)');
xlim([4000,5000]);
end

legend(num2str(a'));





















