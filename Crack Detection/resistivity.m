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

disp(sprintf('%%Using lead as calibration we get:'))
disp(sprintf('%%\tAl_p: %.2e, Cu_p: %.2e, Brass_p: %.2e, Cadmium_p: %.2e',C/Vd(1),C/Vd(3),C/Vd(4), C/Vd(5)))

Calculated_Al_p = C/Vd(1);
Calculated_Cu_p = C/Vd(3);
Calculated_Brass_p = C/Vd(4);
Calculated_Cadmium_p = C/Vd(5);

%Using lead as calibration we get:
%	Al_p: 1.89e-07, Cu_p: 1.92e-07, Brass_p: 1.96e-07, Cadmium_p: 1.89e-07
