% Aaron Bruner
% C16480080
% MATLAB 3
clear; clc; close all;


%1.1
xt = 0:19; % Time for x[n]
ht = 0:29; % Time for h[n]

x = ((xt>=0)&(xt<=19));
h = ((ht>=0)&(ht<=29));

figure();
subplot 211;
plot([0,0],[-1,2],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
hold on;
stem(xt, x, 'Marker','.','Color',[0,0,0.8],'LineWidth',2);
hold off;
axis([-1,20,-1,2]);
title('Plot for Part 1.1 - x[n]');
xlabel('n');
ylabel('x[n]');

subplot 212;
plot([0,0],[-1,2],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
hold on;
stem(ht, h, 'Marker','.','Color',[0,0.8,0],'LineWidth',2);
hold off;
axis([-1,30,-1,2]);
title('Plot for Part 1.1 - h[n]');
xlabel('n');
ylabel('h[n]');

%1.2

xht = xt(1)+ht(1):xt(end)+ht(end);
z = conv(x,h);

fprintf('1.3\n');
fprintf('The peak height is: %i', max(z));
fprintf(' which is repeated %i number of times.\n', nnz(z == max(z(:))));
fprintf(['\nThe gerneral case hypothesize can be written as follows:' ...
'\nThe peek height for (x * h)[n] given x[n]''s m_1 and h[n]''s m_2 ' ...
'is always just m_1 for any system. The number of repetitions is ' ...
'm_2 - m_1 + 1.\n']);

figure();
plot([0,0],[-1,22],'LineStyle','-','Color',[0,0,0],'LineWidth',1);
hold on;
stem(xht, z, 'Marker','.','Color',[0,0,0.8],'LineWidth',2);
hold off;
axis([-1,50,-1,22]);
title('Plot for Part 1.1 - (x * h)[n]');
xlabel('n');
ylabel('(x * h)[n]');


%2.1
s = 0.01; % Sampling Time
t = 0:s:10;
tt= t(1)+t(1):s:t(end)+t(end);
x = sqrt(t).*exp((-1).*t);
zz = conv(x,x).*s;

figure();
hold on;
plot([0,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1); %xaxis
plot([0,0],[0,0.5],'LineStyle','-','Color',[0,0,0],'LineWidth',1); %yaxis
p1 = plot(t,x,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([0,10,0,0.5]);
title('Plot For Part 2.1 - x(t)');
xlabel('t');
ylabel('x(t)');

figure();
hold on;
plot([0,10],[0,0],'LineStyle','-','Color',[0,0,0],'LineWidth',1); %xaxis
plot([0,0],[0,0.25],'LineStyle','-','Color',[0,0,0],'LineWidth',1); %yaxis
plot(tt,zz,'LineStyle','-','Color',[0.8,0,0],'LineWidth',2);
hold off;

axis([0,10,0,0.25]);
title('Plot For Part 2.1 - y(t)');
xlabel('t');
ylabel('y(t)');

%2.2
s = 0.01; % Sampling Time
xt = 0:s:20;
c = 0.393;
z = c.*(xt).^2.*exp(-xt);
MSE = sum(abs(zz - z).^2).*s;
E_z = sum(abs(z).^2).*s;

fprintf('\n2.2\nDifference between y(t) and z(t)=%0.4i.\n',MSE);
fprintf('MSE divided by the energy of y(t) is %0.9f%%.\n', (MSE/E_z)*100);
fprintf('The best value of c is %0.3f.\n', c);

% clear;