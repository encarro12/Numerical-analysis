function [t,x] = mab2(f,intervalo, x0, N, met)

h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2); % Se podría haber utilizado linspace
% Paso 1
[~, x] = met(f, [t(1), t(2)], x0, 2)
% Transpose x
x=x.';
% Paso 2
y = [f(t(1),x(:,1)), f(t(2),x(:,2))]
c = [-1,3]
for i = 1:N-1
    x(:,i+2) = x(:,i+1) + h/2*c*y;
    y(:,1) = y(2); 
    y(:,2) = f(t(i+2),x(:,i+2));
end
t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)