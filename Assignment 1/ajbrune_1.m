% Aaron Bruner
% C16480080
% MATLAB 1
clear; clc; close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('================================\n');
fprintf('\tPart 1\n');
fprintf('================================\n');

n = -100:100;
x = (10*(n.^4+20*n.^3-1000))./(n.^2+100).^2;

xmax = max(x);
xmin = min(x);
nmax = n(x==xmax);
nmin = n(x==xmin);

fprintf('xmax = %0.3f\n', xmax);
fprintf('xmin = %0.3f\n', xmin);
fprintf('nmin = \n');
fprintf('    %0.3f\n', nmin);
fprintf('\n');
fprintf('nmax = \n');
fprintf('    %0.3f\n', nmax);
fprintf('\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      1b                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[garbage,values] = min((x-5).^2);
nzero = n(values);
fprintf('zero = %0.3f\n', nzero);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('================================\n');
fprintf('\tPart 2 - Figures\n');
fprintf('================================\n');

s = 0.01; % sampling time
ta = -10:s:10;

x = 4.*((ta>=-5)&(ta<-3)) + sqrt(25-ta.^2).*((ta>=-3)&(ta<4)) + ...
    3.*((ta>=4)&(ta<8));
x1= -2.*x;

figure();
subplot 121;
hold on;
plot([-10,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-15,15],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

p1a = plot(ta,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
p2a = plot(ta-3,x1,'LineStyle',':','Color',[0,0.8,0]','LineWidth',2);
plot([7,10],[0,0],'LineStyle',':','Color',[0,0.8,0],'LineWidth',2);

hold off;
axis([-10,10,-15,10]);
title('Plot For Q2a');
xlabel('t');
ylabel('x(t)');
legend([p1a,p2a],'x(t)','-2x(t+3)','Location','northeast');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      2b                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tb = -15:s:15;
x = 4.*((tb>=-5)&(tb<-3)) + sqrt(25-tb.^2).*((tb>=-3)&(tb<4)) + ...
    3.*((tb>=4)&(tb<8));

subplot 122;
hold on;
plot([-15,15],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-5,10],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

p1b = plot(tb,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
p2b = plot(tb*1.25,x*0.5,'LineStyle',':','Color',[0,0.8,0]','LineWidth',2);

hold off;
axis([-10,15,-5,10]);
title('Plot For Q2b');
xlabel('t');
ylabel('x(t)');
legend([p1b,p2b],'x(t)','0.5*x(0.75*t)','Location','northeast');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      2c                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tc = -10:s:10;
x = 4.*((tc>=-5)&(tc<-3)) + sqrt(25-tc.^2).*((tc>=-3)&(tc<4)) + ...
    3.*((tc>=4)&(tc<8));

figure();
subplot 211;
hold on;

plot([-10,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-5,10],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

evenx1 = 0.5.*x;
evenx2 = 0.5.*x(end:-1:1);
even = evenx1 + evenx2;
p1c = plot(tc,even,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);

hold off;
axis([-10,10,-5,10]);
title('Plot For Q2c - Even Function');
xlabel('t');
ylabel('x(t)');
legend(p1c,'Ev{x(t)}','Location','northeast');

subplot 212;
hold on;
plot([-10,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-5,10],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

oddx1 = 0.5.*x;
oddx2 = 0.5.*-x(end:-1:1);
odd = oddx1 + oddx2;
p1c = plot(tc,odd,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);

hold off;
title('Plot For Q2c - Odd Function');
xlabel('t');
ylabel('x(t)');
legend(p1c,'Odd{x(t)}','Location','northeast');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('================================\n');
fprintf('\tPart 3 - Figures\n');
fprintf('================================\n');

s=0.01;
t=-2:s:14;
t2=t(2:end);

x = (2.*t).*((t>=0)&(t<3)) + (18-4.*t).*((t>=3)&(t<6)) + ...
    (t-12).*((t>=6)&(t<12));
y = diff(x)/s;

figure();
hold on;

plot([-2,14],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-10,10],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

p1 = plot(t,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
p2 = plot(t2,y,'LineStyle',':','Color',[0,0.8,0],'LineWidth',2);

hold off;
title('Plot for Q3a - Derivative Signal');
xlabel('t');
ylabel('x(t)');
legend([p1,p2],'Original Function - x(t)',...
    'First Derivative - d/dt x(t)','Location','northeast');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      3b                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = cumsum(x)*s;

figure();
hold on;

plot([-2,14],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
plot([0,0],[-10,10],'LineStyle','-','Color',[0,0,0],'LineWidth',1);

p1 = plot(t,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
p2 = plot(t,y,'LineStyle',':','Color',[0,0.8,0],'LineWidth',2);

hold off;
title('Plot for Q3b - Integral Signal');
xlabel('t');
ylabel('x(t)');
legend([p1,p2],'Original Function - x(t)','Integrated Function x(t)',...
    'Location','southwest');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;