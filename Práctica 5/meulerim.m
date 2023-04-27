function [t,x]=meulerim(intervalo,x0,N,mu)
h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2); % Se podría haber utilizado linspace
% Paso 1
x(:,1) = x0(:);
% Paso 2
for i = 1:N
    x(:,i + 1) = (x(:,i) + h*mu*cos(t(i) + 1))/(h*mu + 1);
end
t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)