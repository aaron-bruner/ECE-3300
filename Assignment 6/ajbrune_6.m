% Aaron Bruner
% C16480080
% MATLAB 6
clear; clc; close all;

%1
sys=tf([0 2 16 44 40],[1 12 62 156 169]);
[h,t]=impulse(sys);
figure();
impulse(sys);

%2
sys2=zpk([-2 -3+1i -3-1i],[-3+2i -3-2i -3+2i -3-2i],[2]);
[h,t]=impulse(sys2);
figure();
impulseplot(sys, 'c', sys2, '--m');
legend('tf','zpk');

%3
y=lsim(sys,h,t);
iSim=lsiminfo(y,t);
fprintf('Problem 3\n');
fprintf('\tSettlingTime\t%0.2d\n',iSim.SettlingTime);
fprintf('\tMin\t%0.2d\n',iSim.Min);
fprintf('\tMinTime\t%0.2d\n',iSim.MinTime);
fprintf('\tMax\t%d\n',iSim.Max);
fprintf('\tMaxTime\t%0.2d\n\n',iSim.MaxTime);

%4
[g,t]=step(sys);
figure();
step(sys);
iStep=stepinfo(sys);
fprintf('Problem 4\n');
fprintf('\tRiseTime\t%0.2d\n',iStep.RiseTime);
fprintf('\tSettlingTime\t%0.2d\n',iStep.SettlingTime);
fprintf('\tSettlingMin\t%0.2d\n',iStep.SettlingMin);
fprintf('\tSettlingMax\t%0.2d\n',iStep.SettlingMax);
fprintf('\tOvershoot\t%0.2d\n',iStep.Overshoot);
fprintf('\tUndershoot\t%0.2d\n',iStep.Undershoot);
fprintf('\tPeak\t%0.2d\n',iStep.Peak);
fprintf('\tPeakTime\t%0.2d\n',iStep.PeakTime);

%5
[x,t]=gensig('square',3,12,0.01);
y=lsim(sys,x,t);
figure();
lsim(sys,x,t);
iSim=lsiminfo(y,t);

%6
figure();
bode(sys,{10^(-1),10^(3)});

%7
figure();
pzplot(sys);