i = 1;
mid = midpoints(:,1);
value = midpoints(:,2);
while i~=size(mid,1)
	if mid(i+1)-mid(i) <limit/2
		mid(i) = [];
		value(i) = [];
	else
		i=i+1;
	end
end
	
