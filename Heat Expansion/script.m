clear all; close all;
%Laser Wavelength
WL = 632.8e-9;

%Silvery
sL = (400e-3)-(20e-3);
sFr = load('silver/rawData.lvm');
sT1RAW = load('silver/tempData(V)_ovre.lvm');
sT2RAW = load('silver/tempData(V)_undre.lvm');
sT1 = [sT1RAW(:,1) sT1RAW(:,2)*24444.44];
sT2 = [sT1RAW(:,1) sT2RAW(:,2)*24689.14];
sT = [sT1(:,1) (sT1(:,2)+sT2(:,2))./2];
%68
%458

sST = find(sT(:,1)>68);
sET = find(sT(:,1)>458);
sSF = find(sFr(:,1)>68);
sEF = find(sFr(:,1)>458);

sFr = sFr(sSF(1):sEF(1),:);
sT = sT(sST(1):sET(1),:);
sT2RAW = sT2RAW(sST(1):sET(1),:);
sT1RAW = sT1RAW(sST(1):sET(1),:);

[sMidPoints sMiddle] = findpks(sFr);
sMid = limitmid(sMidPoints,0.02);
sMids = size(sMid,1);
sDeltaTemp = sT(end,2)-sT(1,2);
sAlpha = (sMids/4)*WL/(sL*sDeltaTemp);




sT1(sET(1),2);
sT2(sET(1),2);

%Goldy
gL = (279.5e-3)-(20e-3);

gFr = load('gold/rawData.lvm');
gT1RAW = load('gold/tempData(V)_ovre.lvm');
gT2RAW = load('gold/tempData(V)_undre.lvm');
gT1 = [gT1RAW(:,1) gT1RAW(:,2)*24444.44];
gT2 = [gT1RAW(:,1) gT2RAW(:,2)*24689.14];
gT = [gT1(:,1) (gT1(:,2)+gT2(:,2))./2];
%30
%492

gST = find(gT(:,1)>30);
gET = find(gT(:,1)>492);
gSF = find(gFr(:,1)>30);
gEF = find(gFr(:,1)>492);

gFr = gFr(gSF(1):gEF(1),:);
gT = gT(gST(1):gET(1),:);
gT2RAW = gT2RAW(gST(1):gET(1),:);
gT1RAW = gT1RAW(sST(1):gET(1),:);

[gMidPoints gMiddle] = findpks(gFr);
gMid = limitmid(gMidPoints,0.02);
gMids = size(gMid,1);
gDeltaTemp = gT(end,2)-gT(1,2);
gAlpha = (gMids/4)*WL/(gL*gDeltaTemp);

disp('%%silvery: ')
disp(sprintf('%%\ttemp: start: %f, end: %f, delta: %f', sT(1,2),sT(end,2),sDeltaTemp))
disp(sprintf('%%\tmidcrossings: %d, (assuming double pattern) Heat Exp Coeff: %e', sMids, sAlpha))

disp('%%goldy: ')
disp(sprintf('%%\ttemp: start: %f, end: %f, delta: %f', gT(1,2),gT(end,2),gDeltaTemp))
disp(sprintf('%%\tmidcrossings: %d, (assuming double pattern) Heat Exp Coeff: %e', gMids, gAlpha))

