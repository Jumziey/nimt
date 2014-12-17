clear all; close all;

cal = load('cal.lvm');

%0-3.327
%12.23-18.87
%24.82 - 35.14
%41.22-49
%55.69-end

values = [ 	0.00 12.23 24.82 41.22 55.69; 
						3.32 18.87 35.14 49.00 cal(end,1)];

ei = find(cal(:,1)>values(2,1),1, 'first');
nCal(:,2) = cal(1:ei,2);
nCal(:,1) = zeros(size(cal(1:ei,2)));
for i = 2:size(values,2)
	si = find(cal(:,1)>=values(1,i),1, 'first');
	ei = find(cal(:,1)>=values(2,i),1, 'first');
	p = [ones(size(cal(si:ei,2)))*(i-1)*10e-6 cal(si:ei,2)  ];
	nCal = [nCal;p];
end

plot(nCal(:,1), nCal(:,2), 'r*')
ylabel('Output Voltage')
xlabel('Displacement')

[p,S,mu] = polyfit(nCal(:,1),nCal(:,2),1)
[y, delta] = polyval(p,nCal(:,1),S,mu)
