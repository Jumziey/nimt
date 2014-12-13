function [midpoints middle] = findpks(sFringe)

sFMean = mean(sFringe(:,2));
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
