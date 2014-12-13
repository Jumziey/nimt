sTemp1 = load('tempData(V)_ovre.lvm');
plot(sTemp1(:,1),sTemp1(:,2))

487
42

s = find(sFringe(:,1)>42);
e = find(sFringe(:,1)>487);
mF = sFringe(s(1):e(1),:)

