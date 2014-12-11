clear all; close all;

sol1 = [4.38 4.88 4.47];
sol2 = [4.06 4.56 4.13];
sol12 = [2.38 2.63];

disp(sprintf('Sol1 crack diff: %.2f',sol1(2)-sol1(1)));
disp(sprintf('Sol2 crack diff: %.2f',sol2(2)-sol2(1)));
disp(sprintf('Differential crack diff: %.2f',sol12(2)-sol12(1)));
