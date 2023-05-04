alpha=30; beta=1; T=250; intervalo=[0,T]; x0=[0.1, 0.1]; N=1000;
f=@(t,x) [x(2); -alpha*(x(1)^2 - beta)*x(2) - x(1)]; 
%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
% k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;