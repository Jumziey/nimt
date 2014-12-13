%Co
errT1 = 1;
V = 0.00405;
Co = sqrt((1/V^2)*errT1^2);
%Cu
errT1 = 1;
V = 0.00397;
Cu = sqrt((1/V^2)*errT1^2);

%figure(1)
%subplot(1,2,1)
%plot(gT(:,2),abs(gT1(gST(1):gET(1),2)-gT2(gST(1):gET(1),2)))
%title('Absolute Difference Between Temperature Measure Points At Certain Mean Temperatures')
%xlabel('Mean temperature (c)')
%ylabel('Absolute Difference Between Temperature Measure Points (c)');

%subplot(1,2,2)
%plot(sT(:,2),abs(sT1(sST(1):sET(1),2)-sT2(sST(1):sET(1),2)))
%title('Absolute Difference Between Temperature Measure Points At Certain Mean Temperatures')
%xlabel('Mean temperature (c)')
%ylabel('Absolute Difference Between Temperature Measure Points (c)');

gProbeStartErr = (gT1RAW(1,2)*Co+gT2RAW(1,2)*Cu)/2
gProbeEndErr   = (gT1RAW(end,2)*Co+gT2RAW(end,2)*Cu)/2

sProbeStartErr = (sT1RAW(1,2)*Co+sT2RAW(1,2)*Cu)/2
sProbeEndErr   = (sT1RAW(end,2)*Co+sT2RAW(end,2)*Cu)/2


%Goldy
n = 3918;
errN = n*0.1;
errL = 1e-3;
errGDeltaTemp = 16.5;
ErrGoldyHeatExpCoeff = sqrt( (WL/(4*gL*gDeltaTemp))^2*errN^2 + (WL*n/(4*gL^2*gDeltaTemp))^2*errL^2+(WL*n/(4*gL*gDeltaTemp^2))^2*errGDeltaTemp^2);

%Silvery
n = 5569;
errN = n*0.1;
errL = 1e-3;
errSDeltaTemp = 11.75;
ErrSilveryHeatExpCoeff = sqrt( (WL/(4*sL*sDeltaTemp))^2*errN^2 + (WL*n/(4*sL^2*sDeltaTemp))^2*errL^2+(WL*n/(4*sL*sDeltaTemp^2))^2*errSDeltaTemp^2);

disp(sprintf('%%Error for the Silvery Heat Expansion Coefficient = %e', ErrSilveryHeatExpCoeff))
disp(sprintf('%%Error for the Goldy Heat Expansion Coefficient = %e', ErrGoldyHeatExpCoeff))
