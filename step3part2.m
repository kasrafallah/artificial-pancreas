clc;
clear;
samples = 10;
K =linspace(0,30,samples);
Ts =0;
figure;
subplot(2,1,1);
sim('step3');
y = simout1.data;
t = simout1.Time;
plot(t,110+y);
grid on; grid minor;
title('meal glucose input to body ')
ylabel(' input of blood glucose ');
xlabel('t(min)');
xlim([0,500]);
ylim([0,200]);
hold on ;
plot(t,180,'c--')
a = [];
for i=1 : samples
a = [a,[(K(i))]];
Ts =K(i);
sim('step3');
y = simout.data;
t = simout.Time;
subplot(2,1,2)
hold on;
plot(t,y);
pause(0.005);
grid on; grid minor;
title('output of system after meal')
ylabel('blood glucose ');
xlabel('t(min)');
xlim([0,500]);
end
legend(num2str(a'));



