clear all
clc
L=0.931;
ap=[100 80 60];
errorL=2e-3;
errorT=2e-4;
air=[2.8e-3 2.82e-3 2.88e-3];
air80k=[2.9e-3 2.78e-3 2.84e-3];
air60k=[2.84e-3 2.7e-3 2.88e-3];
%% v of s in air
for i=1:3
    vair(i)=L/air(i);
end
vairAv(1)=(vair(1)+vair(2)+vair(3))/3;
for i=1:3
    errorair(i)=sqrt((1/air(i))^2*errorL^2+(L/air(i)^2)^2*errorT^2);
end
errorairAv(1)=(errorair(1)+errorair(2)+errorair(3))/3;
%% v of s in air at 80kPa
for i=1:3
    vair80k(i)=L/air80k(i);
end
vairAv(2)=(vair80k(1)+vair80k(2)+vair80k(3))/3;
for i=1:3
    errorair80k(i)=sqrt((1/air80k(i))^2*errorL^2+(L/air80k(i)^2)^2*errorT^2);
end
errorairAv(2)=(errorair80k(1)+errorair80k(2)+errorair80k(3))/3;
%% v of s in air at 60kPa
for i=1:3
    vair60k(i)=L/air60k(i);
end
vairAv(3)=(vair60k(1)+vair60k(2)+vair60k(3))/3;
for i=1:3
    errorair60k(i)=sqrt((1/air60k(i))^2*errorL^2+(L/air60k(i)^2)^2*errorT^2);
end
errorairAv(3)=(errorair60k(1)+errorair60k(2)+errorair60k(3))/3;
%%
vairAv
errorairAv
%% Plot results

figure(1)
errorbar(ap,vairAv,errorairAv,'-o','LineWidth',2,'MarkerSize',6,'MarkerEdgeColor','k','MarkerFaceColor',[.49 1 .63]);
ylabel('Velocity (m/s)','FontSize',12);
xlabel('Pressure (kPa)');
%title('Sound velocity in the air at different pressures');

c = polyfit(ap,vairAv,1);
hold on
plot(ap,ap*c(1)+c(2),'m')
legend('Speed of Sound c_s (m/s)', 'Linear Regression of c_s(Pressure) (m/s)');
c(1)

