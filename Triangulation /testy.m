x = 1:10;
y = 1:10;
set(0, 'defaultTextInterpreter', 'latex');
plot(x,y)
set(gca,'FontSize',12)
title('Nice big title','FontSize',18)
xlabel('Normal x-axis label')
ylabel('Pretty big y-axis label','FontSize',14)
