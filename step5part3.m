
clc;
clear;
samples = 4;
AM = 50;
Ts =4;
figure;
k_num =4*[.1,.3,.5,.7,.9]*12294
theta =4*[.1,.3,.5,.7,.9]*73

for j = 1:samples
    a = [];
    subplot(2,2,j)
for i=1 : samples
a = [a,[(-k_num)]];
k = -457/((k_num(i)./40)*(282 +theta(j)));
Ts =10;
sim('step4');
y = simout.data;
t = simout.Time;
hold on;
plot(t,y);
pause(0.005);
grid on; grid minor;
title(['output of system after meal for theta = ',num2str(theta(j))])
ylabel('blood glucose ');
xlabel('t(min)');
xlim([4000,5000]);
legend(num2str(a'));
end
hold on;
plot(t,ones(1,length(t))*180,'g--.')
plot(t,ones(1,length(t))*70,'g--.')
plot(t,ones(1,length(t))*140,'c--')
plot(t,ones(1,length(t))*80,'c--')
end