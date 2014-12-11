clear all; close all;

ex = [ 3.60 4.03 3.81];
dir = [ 4.03 4.47 4.16];

disp(sprintf('Direct Exitation'));
disp(sprintf('\tVoltage Drop Off: %f, Voltage Crack Diff: %f',dir(3)-dir(1), dir(2)-dir(1)))

disp(sprintf('Transformer Exitation'));
disp(sprintf('\tVoltage Drop Off: %f, Voltage Crack Diff: %f',ex(3)-ex(1), ex(2)-ex(1)))

