close all; clear all;

meas = load('meas.lvm');

%plot(meas(:,1),meas(:,2))
x0 = meas(8255+25:7.9e4,2);
[peakLoc, peakMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, 1);
[valleyLoc, valleyMag] = peakfinder(x0,(max(x0)-min(x0))/16, -0.25, -1);

magnitude = abs(peakMag-valleyMag(1:end-1));
p = 1.0e+03 *[ 3.763712430721664 -0.000073768836834];
displacement = magnitude*p(1)+p(2);
plot(displacement(127:end))
