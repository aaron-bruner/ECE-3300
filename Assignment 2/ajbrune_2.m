% Aaron Bruner
% C16480080
% MATLAB 2
clear; clc; close all;

%1.1
s = 0.01;
t = -12:s:12;
t_per = t-8.*round(t./8);
x = ((16-t_per.^2).^(1/3)).*((t_per>=-4)&(t_per<4));

figure();
subplot 221;
hold on;
plot([-12,12],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-4,5],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

plot_x = plot(t,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([-12,12,-4,5]);
title('Plot For Problem Statement: Part 1.1');
xlabel('t');
ylabel('x(t)');
legend(plot_x,'x(t)','Location','northeast');

%1.2
subplot 222;
hold on;
plot([-12,12],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-12,12],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

plot_dx = plot(t(2:end),diff(x)./s,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([-12,12,-12,12]);
title('Plot For Problem Statement: Part 1.2');
xlabel('t');
ylabel('d/dt x(t)');
legend(plot_dx,'d/dt x(t)','Location','northeast');

%1.3
t = -10:s:10;
z = (((2-1j.*t)./(1-1j.*t)).*(exp(2*1j*t))).*((t>=-8)&(t<8));

subplot 223;
hold on;
plot([-10,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-4,4],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

plot_magz = plot(t,abs(z),'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([-10,10,-4,4]);
title('Plot For Problem Statement: Part 1.3');
xlabel('t');
ylabel('|z(t)|');
legend(plot_magz,'|z(t)|','Location','northeast');

%1.4
subplot 224;
hold on;
plot([-10,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-4,6],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

plot_magz = plot(t,angle(z),'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([-10,10,-4,6]);
title('Plot For Problem Statement: Part 1.4');
xlabel('t');
ylabel('∠z(t)');
legend(plot_magz,'∠z(t)','Location','northeast');


%2.1
t = 0:s:4;
x = (2*sin(pi*t)).*((t>=0)&(t<1))+((t).^(2/3)).*((t>=2)&(t<3));
y = ((t-2).^2).*((t>=0)&(t<4));

Ex = sum(abs(x).^2).*s;
fprintf('Problem 2.1\nEx = %0.3f\t', Ex);
Ey = sum(abs(y).^2).*s;
fprintf('Ey = %0.3f\t', Ey);
Rxy = sum(x.*conj(y)).*s;
fprintf('Rxy = %0.3f\t', Rxy);
pxy = Rxy./((Ex.*Ey)^(1/2));
fprintf('ρxy = %0.3f\n\n', pxy);

%2.2
z = y - (Rxy./Ex).*x;

Ez = sum(abs(z).^2).*s;
fprintf('Problem 2.2\nEz = %0.3f\t', Ez);
Rxz = sum(abs(z).^2).*s;
fprintf('Rxz = %0.3f\t', Rxz);
pxz = Rxz./((Ex.*Ez)^(1/2));
fprintf('ρxz = %0.3f\n', pxz);

%2.3
t = 0:s:12;
x = (2*cos(pi*t)).*((t>=0)&(t<3)) + ((t).^(4)).*((t>=3)&(t<6));
y = ((t).^(2)).*((t>=0)&(t<4)) + (t/5).*((t>=4)&(t<6));

Ex = sum(abs(x).^2).*s;
Rxy = sum(x.*conj(y)).*s;
fprintf('\nProblem 3.3\nRxy = %0.3f\t', Rxy);

z = y - (Rxy./Ex).*x;
Ez = sum(abs(z).^2).*s;
Rxz = sum(x.*conj(z)).*s;
pxz = Rxz./((Ex.*Ez)^(1/2));
fprintf('ρxz = %0.3f\n', pxz);

clear;