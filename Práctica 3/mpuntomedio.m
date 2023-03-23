function [t,x] = mpuntomedio(f,intervalo, x0, N)

h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2); % Se podría haber utilizado linspace
% Paso 1
x(:,1) = x0;
x(:,2) = x(:,1) + h*f(t(1), x(:,1));
% Paso 2
for i = 1:N-1
    x(:,i+2) = x(:,i) + 2*h*f(t(i+1), x(:,i+1));   
end
t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)