function [t,x] = mab2am2(f,intervalo, x0, N)
% Número de iteraciones (correciones)
m = 1;

% INICIALIZACIÓN: Método de Euler Mejorado
h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
[~, x] = meulermej(f, [t(1), t(2)], x0, 2);
x = x.';

% GUARDAR EVALUACIONES DE f
y = [f(t(1), x(:,1)), f(t(2),x(:,2))];
c_am2 = [-1, 8, 5];
c_mab2 = [-1, 3];

% BUCLE
for i = 1:N-r+1
    % Predicción (P) con Método de Adams-Bashford
    x(:,i+2) = x(:,i+1) + (h/2)*y*(c_mab2.');
    % Evaluación-Corrección (EC)**m
    for j = 1:m+1
        Y = [y, f(t(i+2),x(:,i+2))];
        x(:,i+2) = x(:,i+1) + (h/12)*Y*(c_am2.');
    end
    % Evaluación
    y = [y(:,2), f(t(i+2), x(:,i+2))];
end

t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)






