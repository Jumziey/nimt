close all; clear all;
%Geometry Testing
rec = [3.06 3.38 3.00];
recDiff = abs(rec(1)-rec(2));
recDrop = abs(rec(3)-rec(1));

weird = [3.69 4.00 3.75];
weirdDiff = abs(weird(1)-weird(2));
weirdDrop = abs(weird(3)-weird(1));

sol = [5.25 5.94 5.44];
solDiff = abs(sol(1)-sol(2));
solDrop = abs(sol(3)-sol(1));
disp(sprintf('%%Rectangular Geometry Crack diff: %f',recDiff));
disp(sprintf('%%Rectangular geometry Metal diff: %f',recDrop));
disp(sprintf('%%Weird geometry diff: %f',weirdDiff));
disp(sprintf('%%Weird geometry Metal diff: %f',weirdDrop));
disp(sprintf('%%Solenoid geometry diff: %f',solDiff));
disp(sprintf('%%Solenoid geometry Metal diff: %f',solDrop));

