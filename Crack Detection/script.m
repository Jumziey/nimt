close all; clear all;
Vn = 5.63;
Vd = Vn - [4.00 4.13 4.03 4.06 4.00];
VdName = {'Aluminum' 'Lead' 'Copper' 'Brass' 'Cadmium'};
%p = C/Ud

Al_p = 2.655E-08;
Pb_p = 2.053E-07;
Cu_p = 1.664E-08;
Cd_p = 6.842E-08;

C = Pb_p*Vd(2);

disp(sprintf('Using aluminium as calibration we get:'))
disp(sprintf('\tPb_p: %.2e, Cu_p: %.2e, Brass_p: %.2e, Cadmium_p: %.2e',C/Vd(2),C/Vd(3),C/Vd(4), C/Vd(5)))

Calculated_Pb_p = C/Vd(2);
Calculated_Cu_p = C/Vd(3);
Calculated_Brass_p = C/Vd(4);
Calculated_Cadmium_p = C/Vd(5);
