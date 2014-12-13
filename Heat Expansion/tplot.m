gT1 = load('gold/tempData(V)_ovre.lvm');
gT2 = load('gold/tempData(V)_undre.lvm');
gT1(:,2) = gT1(:,2)*24444.44;
gT2(:,2) = gT2(:,2)*24689.14;
gT = [gT1(:,1) (gT1(:,2)+gT2(:,2))./2];

subplot(1,2,1)
plot(gT(:,1),gT(:,2))
xlabel('Time');
ylabel('Temp (c)');
title('Goldy')
%30
%492

sT1 = load('silver/tempData(V)_ovre.lvm');
sT2 = load('silver/tempData(V)_undre.lvm');
sT1(:,2) = sT1(:,2)*24444.44;
sT2(:,2) = sT2(:,2)*24689.14;
sT = [sT1(:,1) (sT1(:,2)+sT2(:,2))./2];

subplot(1,2,2)
plot(sT(:,1),sT(:,2))
xlabel('Time');
ylabel('Temp (c)');
title('Silvery')
%68
%458
