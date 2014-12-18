close all; clear all;

meas = load('meas.lvm');

%plot(meas(:,1),meas(:,2))
x0 = meas(8255+25:7.9e4,2);
T = meas(8255+25:7.9e4,1);
%plot(x0)
[peakLoc, peakMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, 1);
[valleyLoc, valleyMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, -1);


magnitude = abs(peakMag-valleyMag(1:end-1));
ste = 1.0e-07 * [0.266481354324753;
   							0.013809213102110];

p = 1.0e-03 * [0.264638662779562 0.019618899568995];
displacement = (magnitude*p(1)+p(2))/2;
subplot(2,1,1)
plot(log(displacement))
subplot(2,1,2)
plot(displacement)

L = max(T)-min(T);
Fs = 10000;
NFFT = 2^nextpow2(L); % Next power of 2 from length of x0

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


