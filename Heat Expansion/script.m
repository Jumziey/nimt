clear all; close all;
sFringe = load('rawData_silver.lvm');
sTemp1 = load('tempData(V)_ovre_silver.lvm');
sTemp2 = load('tempData(V)_undre_silver.lvm');

sFMean = 6.8;%mean(sFringe(:,2));
%rawPks = findpeaks(sFringe(:,2));
%pksIndex = find(rawPks>sFMean);
%pks = rawPks(pksIndex);

peakDist = 0.01; %The smallest peak distance that will be recorded as a peak and not noise
[rawPks,rawLoc] = findpeaks(sFringe(:,2));


%Removing every peak that is below a certain value
AMInd = find(rawPks>sFMean);
rawPks = rawPks(AMInd);
rawLoc = rawLoc(AMInd);
j=0;
for i=[1:size(rawPks,1)-1]
	if(abs(sFringe(rawLoc(i),1)-sFringe(rawLoc(i+1),1))>peakDist)
		j=j+1;
		loc(j) = rawLoc(i);
	end
end

plot(sFringe(:,1),sFringe(:,2), '*')
hold on
plot(sFringe(:,1),sFringe(:,2), 'g')
%plot(sFringe(loc,1),sFringe(loc,2), 'vr')
ylabel('Voltage Response From Photodiode Circuit')
xlabel('Time (s)');

legend('Response of Fringe Pattern', 'All Detected Peaks')
