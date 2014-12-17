close all; clear all;
foc = [-300 -250 -200 -150 -100 -50 50 100 150 200 250 300]*10^(-3);

a = linspace(0,0.60,100);
%b =@(a) foc*a./(a-foc);

hold on
i=1;
for f = foc
	subplot(4,6,i)
	b =@(a) -f*a./(a-f);
	plot(a,b(a)./a)
	title(sprintf('Foc = %d',f))
	xlabel('distance a');
	ylabel('magnification');
	subplot(4,6,i+1)
	plot(a,b(a))
	title(sprintf('Foc = %d',f))
	xlabel('distance a');
	ylabel('distance b');
	i=i+2;
end
