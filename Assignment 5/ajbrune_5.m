% Aaron Bruner
% C16480080
% MATLAB 5
clear; clc; close all;

%1
w = 0.5 .* logspace(0,5,500);
Xjw = 80.*1i.*w.*(60+1i.*w).*(400+1i.*w)./((80+1i.*w).*(100+1i.*w).*(150+1i.*w).*(250+1i.*w));
hmag = 20*log10(abs(Xjw));

figure();
semilogx(w,hmag,'LineStyle','-','Color',[0,0,0.8]);
title('1. Bode Magnitude of X(j/omega)');
ylabel('Magnitude of X(j/omega) in dB');
xlabel('\omega');

%2
maxVal = max(hmag);
fprintf('The max value of the Bode magnitude plot is db is: %0.2fdB.\n', maxVal);
if maxVal < 0
    fprintf('The filter is passive.\n\n');
else
    fprintf('The filter is active.\n\n');
end

%3
check = 0; i = 1;
while i < width(hmag)
    if (hmag(i) > max(hmag-20) && check == 0)
        lowFreq = i;
        check = 1;
    end
    if (check == 1)
        if (hmag(i) < max(hmag-20))
            highFreq = i;
            break;
        end
    end
    i = i + 1;
end

fprintf('The lower frequency is ωL = %f\n', w(lowFreq-1));
fprintf('The upper frequency is ωU = %f\n', w(highFreq));
fprintf('The 20db bandwidth of this filter is = %f\n', w(highFreq) - w(lowFreq));

%4
figure();
semilogx(w(2:end),diff(hmag)./diff(log10(w)),'LineStyle','-','Color',[0,0,0.8]);
title('4. Slope of X(jw)');
ylabel('dB');
xlabel('Decade');

%5
figure();
semilogx(w,angle(Xjw),'LineStyle','-','Color',[0,0,0.8]);
title('5. Bode phase plot');
ylabel('Phase of X(j/omega) in dB');
xlabel('\omega');

%6
figure();
semilogx(w(2:end),-1*diff(angle(Xjw))/0.01,'LineStyle','-','Color',[0,0.8,0],'LineWidth',2);
title('6. Group Delay Plot');
ylabel('D(w)');
xlabel('time(w)');

%7
groupDelay = -1.*diff(angle(Xjw))./diff(log10(w));
wLow = w(lowFreq-1);
wHigh = w(highFreq);
Davg = 1/(wHigh - wLow)*sum(groupDelay(lowFreq-1:highFreq).*diff(w(lowFreq-2:highFreq)));
fprintf('\nThe average group dealy is = %f\n', Davg);

DMES = sum(abs(groupDelay(lowFreq-1:highFreq)-Davg).^2./diff(w(lowFreq-2:highFreq)));
fprintf('The Mean Squared Error is = %f\n',DMES);

norm = sqrt(DMES/(wHigh-wLow))/Davg*100;
fprintf('The normalized value is = %f\n', norm);