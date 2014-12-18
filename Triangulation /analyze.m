close all; clear all;
set(0, 'defaultTextInterpreter', 'latex');
fs = 20;
meas = load('meas.lvm');

%plot(meas(:,1),meas(:,2))
x0 = meas(8255+25:7.9e4,2);
t = meas(8255+25:7.9e4,1);

%plot(x0)
[peakLoc, peakMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, 1);
[valleyLoc, valleyMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, -1);


magnitude = peakMag(1:end)-valleyMag(1:end-1);
%magnitude = peakMag - mean(x0);
ste = 1.0e-07 * [0.266481354324753;
   							0.013809213102110];

p = 1.0e-03 * [0.264638662779562 0.019618899568995];
displacement = ((magnitude*p(1))/2);
%displacement = magnitude;

offset = 182;
val = log(displacement);
time = t(peakLoc);
plot(time(offset:end),val(offset:end));
[p,s] = polyfit(time(offset:end),val(offset:end),1);
hold on;
plot(time,time*p(1)+p(2));
ste = sqrt(diag(inv(s.R)*inv(s.R')).*s.normr.^2./s.df);

figure(4)
plot(time,displacement)
hold on;
plot(time(offset:end),max(displacement(offset:end))*exp(p(1)*time(offset:end)));

figure(2)
X0 = abs(fft(x0));
%M = fftshift(meas)
plot(X0)
hp = (length(X0)+1)/2;
sr = 10000;
f = linspace(0,sr/2, hp);
plot(f(3:(end+1)/2),X0(3:(hp+1)/2)/(hp));
xlabel('Frequency(Hz)', 'FontSize', fs)
ylabel('Magnitude', 'FontSize', fs)
title('Frequency Spectrum of the Tuning Fork', 'FontSize', fs);
%sample rate = 10k
