close all; clear all;
%Frequency Dep, voltage diff between no crack and clearly visible
freq = [10 20 30 40 50 60 70 80 90 100;
				1.14 2.02 2.69 3.30 3.97 4.47 5.03 5.53 5.97 6.34;
				1.23 2.19 2.86 3.46 4.10 4.67 5.22 5.69 6.13 6.54;
				0.84 1.63 2.41 3.13 3.88 4.56 5.23 5.81 6.33 6.88;];
				
vDiff = abs(freq(2,:)-freq(3,:));

subplot(3,1,1)
plot(freq(1,:),vDiff)
hold on
plot(freq(1,:),vDiff, '*')
ylabel('Voltage Diff (V)')
xlabel('Frequency (kHz)')
title('Voltage Difference Between no Crack and Visible Crack (steel)')
subplot(3,1,2)
plot(freq(1,:),freq(4,:))
hold on;
plot(freq(1,:),freq(4,:), '*')
ylabel('Voltage (V)')
xlabel('Frequency (kHz)')
title('Voltage without having probe close to conductive material')
disp(' ')

subplot(3,1,3)
plot(freq(1,:),freq(4,:)-freq(2,:))
hold on;
plot(freq(1,:),freq(4,:)-freq(2,:), '*')
ylabel('Voltage Drop (V)')
xlabel('Frequency (kHz)')
title('Voltage drop with probe at steel at different frequencies')
disp(' ')
disp(sprintf('%%Max difference is at %d kHz with a voltage difference of %.2f V', 60 ,0.2))
