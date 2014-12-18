close all; clear all;
%Distance Dependence
dist = [1.7 3 4.6 6 7.3;
				8.06 8.25 8.31 8.31 8.31;
				8.25 8.31 8.31 8.31 8.31;
				8.44 8.44 8.44 8.44 8.44;];
figure(2)
subplot(2,1,1)
plot(dist(1,:), abs(dist(2,:)-dist(4,:)));hold on;
plot(dist(1,:), abs(dist(2,:)-dist(4,:)),'*')
xlabel('Probe Distance from Steel (mm)');
ylabel('Voltage Diff (V)')
title('Voltage Difference Between no Crack and Visible Big Crack (steel)')
('Voltage Difference Between no Crack and Visible small Crack (steel)')

subplot(2,1,2)
plot(dist(1,:), 8.44 - dist(2,:));hold on;
plot(dist(1,:), 8.44 - dist(2,:), '*');
xlabel('Probe Distance from Steel (mm)');
ylabel('Voltage drop (V)')
title('Voltage Drop with Probe Close to Steel Surface')

