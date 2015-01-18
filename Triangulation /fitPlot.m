close all; clear all;
set(0, 'defaultTextInterpreter', 'latex');
fs = 20;
meas = load('meas.lvm');

x0 = meas(8255+25:7.9e4,2);
t = meas(8255+25:7.9e4,1);
x0 = meas(:,2);
t = meas(:,1);
timediff = t(end)-t(1);

[peakLoc, peakMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, 1);
[valleyLoc, valleyMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, -1);



magnitude = peakMag(1:end-1)-valleyMag(1:end);
ste = 1.0e-07 * [0.266481354324753;
   							0.013809213102110];

p = 1.0e-03 * [0.264638662779562 0.019618899568995];

displacement = ((magnitude*p(1))/2);
offset = 182;
time = t(peakLoc);
time = time(1:end-1);


figure(1)
subplot(2,1,1)
plot(time,log(displacement));
[p,s] = polyfit(time,log(displacement),1);
hold on;
plot(time,time*p(1)+p(2));
title(sprintf('tvl(d) p(1)=%e, p(2)=%e, damp=%e',p(1),p(2), p(2)/(2*pi*341)))

subplot(2,1,2)
plot(time,displacement)
hold on;
funccy = @(p,t) (p(1).*exp(p(2).*t));
p2 = lsqcurvefit(funccy,[0.0001 -0.3064] ,time,displacement)
plot(time,exp(time*p2(2))*p2(1))
title(sprintf('tvd p(1)=%e, p(2)=%e, damp=%e',p2(1),p2(2),p2(2)/(2*pi*341)))

endOffset = 800;
offset = 182;

figure(2)
subplot(2,1,1)
plot(time,log(displacement));
[p,s] = polyfit(time(offset:end),log(displacement(offset:end)),1);
hold on;
plot(time,time*p(1)+p(2));
title(sprintf('tvl(d) p(1)=%e, p(2)=%e, damp=%e',p(1),p(2), p(2)/(2*pi*341)))

subplot(2,1,2)
plot(time,displacement)
hold on;
funccy = @(p,t) (p(1).*exp(p(2).*t));
p2 = lsqcurvefit(funccy,[0.0001 -0.3064] ,time(offset:end),displacement(offset:end))
plot(time,exp(time*p2(2))*p2(1))
title(sprintf('tvd p(1)=%e, p(2)=%e, damp=%e',p2(1),p2(2),p2(2)/(2*pi*341)))

figure(3)
subplot(2,1,1)
plot(time,log(displacement));
[p,s] = polyfit(time(offset:endOffset),log(displacement(offset:endOffset)),1);
hold on;
plot(time,time*p(1)+p(2));
title(sprintf('tvl(d) p(1)=%e, p(2)=%e, damp=%e',p(1),p(2), p(2)/(2*pi*341)))

subplot(2,1,2)
plot(time,displacement)
hold on;
funccy = @(p,t) (p(1).*exp(p(2).*t));
p2 = lsqcurvefit(funccy,[0.0001 -0.3064] ,time(offset:endOffset),displacement(offset:endOffset))
plot(time,exp(time*p2(2))*p2(1))
title(sprintf('tvd p(1)=%e, p(2)=%e, damp=%e',p2(1),p2(2),p2(2)/(2*pi*341)))



figure(4)
subplot(2,1,1)
plot(time,displacement)
title('Time Vs Displacement')
subplot(2,1,2)
plot(time,log(displacement))
title('Time Vs Log(Displacement)');
return;
