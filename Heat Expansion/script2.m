clear all; close all;
sFringe = load('rawData_silver.lvm');
sTemp1 = load('tempData(V)_ovre.lvm');
sTemp2 = load('tempData(V)_undre.lvm');


limit = 327 - 326.9;

sF = find(sFringe(:,1)>42);
eF = find(sFringe(:,1)>487);
sT1 = find(sTemp1(:,:)>42);
eT1 = find(sTemp1(:,:)>487);
sT2 = find(sTemp2(:,:)>42);
eT2 = find(sTemp2(:,:)>487);

sFringe = sFringe(sF(1):eF(1),:);
T1 = sTemp1(sT1(1):eT1(1),:);
T1(:,2) = T1(:,2)*24444.44;
%24444.44
T2 = sTemp2(sT2(1):eT2(1),:);
T2(:,2) = T2(:,2)*24689.14;
%24689.14
start_temp = (T1(1,2)+T2(1,2))/2
end_temp = (T1(end,2)+T2(end,2))/2

delta_temp = end_temp-start_temp

sFMean = mean(sFringe(:,2))
tresh = 1;
i = 1;
middle = 0;
midpoints = [0 0];
while true
	%Going up
	if sFringe(i+1,2)>sFringe(i,2) 
		j = i;
		if sFringe(j,2)>sFMean
			disp('breakage1')
			i=i+1;
			continue;
		end
		while true
			if sFringe(i+1,2)>sFringe(i,2) 
				i = i+1;
				if i+1==size(sFringe,1) 
					return;
				end
			else
				if sFringe(i,2) > sFMean
					middle = middle+1;
					midpoints(end+1,:) = sFringe(i,:);
					break;
				else
					i = i+1;
					if i+1==size(sFringe,1) 
						return;
					end
				end
			end
		end
	else
		%Going Down
		j = i;
		if sFringe(j,2)<sFMean
			disp('breakage')
			i=i+1;
			continue;
		end
		while true
			if sFringe(i+1,2)<sFringe(i,2) 
				i = i+1;
				if i+1==size(sFringe,1) 
					middle
					return;
				end
			else
				if sFringe(i,2) < sFMean
					middle = middle+1;
					midpoints(end+1,:) = sFringe(i,:);
					break;
				else
					i=i+1;
					if i+1==size(sFringe,1) 
						return;
					end
				end
			end
		end
	end
end
