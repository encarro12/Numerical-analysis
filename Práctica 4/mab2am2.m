function [t,x] = mab2am2(f,intervalo, x0, N)
% Aquí introducimos las variables que se han de cambiar
% cuando variamos los métodos de corrección predicción o 
% cuando queremos aumentar el número de correcciones
% Número de iteraciones (correciones)
m = 1;
% Número de pasos de los métodos lineales
r = 2;
% Método de inicialización
met = @meulermej;
% Coeficientes de los métodos de predicción corrección
c_corr = (1/12) * [-1, 8, 5];
c_pred = (1/2) * [-1, 3];

% INICIALIZACIÓN: Método de Euler Mejorado
h = (intervalo(2) - intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
[~, x] = met(f, [t(1), t(r)], x0, r - 1);
x = x.';

% GUARDAR EVALUACIONES DE f
y = f(t(1), x(:,1));
for i = 2:r
    y(:,i) = f(t(i),x(:,i));
end

% BUCLE
for i = 1:N-r+1
    % Predicción (P)
    x(:,i+r) = x(:,i+r-1) + h*y*(c_pred.');
    % Evaluación-Corrección (EC)**m
    for j = 1:m
        Y = [y, f(t(i+r),x(:,i+r))];
        x(:,i+r) = x(:,i+r-1) + h*Y*(c_corr.');
    end
    % Evaluación
    y = [y(:,2:r), f(t(i+r), x(:,i+r))];
end

t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)




