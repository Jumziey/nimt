close all; clear all;

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
displacement = (magnitude*p(1)+p(2))/2;

val = -log(displacement);
time = t(peakLoc);
plot(time,val);
[p,s] = polyfit(time,val,1);
hold on;
plot(time,time*p(1)+p(2));
ste = sqrt(diag(inv(s.R)*inv(s.R')).*s.normr.^2./s.df);



figure(2)
X0 = abs(fft(x0));
%M = fftshift(meas)
plot(X0)
hp = (length(X0)+1)/2;
sr = 10000;
f = linspace(0,sr/2, hp);
plot(f(3:(end+1)/2),X0(3:(hp+1)/2)/(hp));
xlabel('Frequency(Hz)')
ylabel('Magnitude')
%sample rate = 10k


