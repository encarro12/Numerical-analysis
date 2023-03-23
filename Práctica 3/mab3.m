function [t,x] = mab3(f,intervalo, x0, N)
r = 3;
met = @meuler;
h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2); % Se podría haber utilizado linspace
% Paso 1
[~, x] = met(f, [t(1), t(r)], x0, r);
% Transpose x
x=x.';
% Paso 2
y = f(t(1), x(:,1));
for i = 2:r
    y(:,i) = f(t(i),x(:,i));
end
c = [5,-16,23];
for i = 1:N-r + 1
    x(:,i+r) = x(:,i+r-1) + h/12*y*(c.');
    y = [y(:,2:r), f(t(i+r), x(:,i+r))];
end
t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)

% Para cambiar el método de Adams-Bashford
% habría que modificar:
% h/~
% c