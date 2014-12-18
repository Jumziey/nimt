close all;
i = find(f>=340,1,'first');
NX = zeros(size(X0));
NX(i-200:i+200) = X0(i-200:i+200);

nx = ifft((NX(1:(length(NX)+1)/2)));
nx = real(nx(1:(length(nx)+1)/2));
nt = linspace(0,max(t),length(nx));
figure(1)
plot(nt,nx)

[peakLoc, peakMag] = peakfinder(nx,(max(nx)-min(nx))/16, 0, 1);
[valleyLoc, valleyMag] = peakfinder(nx,(max(nx)-min(nx))/16, 0, -1);
magnitude = abs(peakMag(1:end)-valleyMag(1:end));
ste = 1.0e-07 * [0.266481354324753;
   							0.013809213102110];

p = 1.0e-03 * [0.264638662779562 0.019618899568995];
displacment = magnitude;

val = magnitude;
time = nt(peakLoc);
figure(2)
plot(time,log(val));
[p,s] = polyfit(time,val,1);
hold on;
plot(time,time*p(1)+p(2));
ste = sqrt(diag(inv(s.R)*inv(s.R')).*s.normr.^2./s.df);
