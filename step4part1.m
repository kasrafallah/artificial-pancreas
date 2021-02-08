%%
clc;
clear;
samples = 4;
K =linspace(0,30,samples);
Ts =0;
k = -0.004188;
figure;
sim('step4');
y = simout1.data;
t = simout1.Time;
plot(t,y,'k--');
grid on; grid minor;
title('meal glucose input to body ')
ylabel(' input of blood glucose ');
xlabel('t(min)');
ylim([0,200]);
xlim([4000,5000]);
a = [];
for i=1 : samples
a = [a,[(K(i))]];
Ts =K(i);
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
legend('real blood glucose rate','Ts = 0','Ts = 10' ,'Ts = 20','Ts = 30',' clinical range max',' clinical range min',' safe clinical range max',' safe clinical range min');
%%
clc;
clear;
samples = 10;
K =linspace(0,36,samples);
Ts =10;
k = -0.004188;
figure;
AM = 0;
sim('step4');
y = simout1.data;
t = simout1.Time;
%plot(t,y,'k--');
grid on; grid minor;
title('meal glucose input to body ')
ylabel(' input of blood glucose ');
xlabel('t(min)');
ylim([0,200]);

a = [];
for i=1 : samples
a = [a,[(K(i))]];
Ts =10;
AM = K(i);
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
legend([num2str(a')])

hold on;
plot(t,ones(1,length(t))*180,'g--.')
plot(t,ones(1,length(t))*70,'g--.')
plot(t,ones(1,length(t))*140,'c--')
plot(t,ones(1,length(t))*80,'c--')
%legend('0',"-100.0000",'-77.7778','-55.5556','-33.3333','-11.1111',' clinical range max',' clinical range min',' safe clinical range max',' safe clinical range min');
