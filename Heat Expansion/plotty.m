clear all; close all;




sFringe = load('rawData_silver.lvm');
sFringe = sFringe(2500:2800,:);
sFMean = mean(sFringe(:,2));
middle = ones(size(sFringe));
middle(:,2) = middle(:,2)*sFMean;

ones = size(sFringe);
plot(sFringe(:,1),sFringe(:,2), 'g')
hold on
plot(sFringe(:,1),sFringe(:,2), '*')
plot(sFringe(:,1),middle(:,2), 'r')
