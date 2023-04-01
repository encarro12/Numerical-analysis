function [t,x] = mab4am4(f,intervalo, x0, N)
% Aquí introducimos las variables que se han de cambiar
% cuando variamos los métodos de corrección predicción o 
% cuando queremos aumentar el número de correcciones
% Número de iteraciones (correciones)
m = 1;
% Número de pasos de los métodos lineales
r = 5;
% Método de inicialización
met = @mrk4;
% Coeficientes de los métodos de predicción corrección
% como métodos lineales de r pasos
beta_pred = (4/3) * [0, 0, 2, -1, 2];
alpha_corr = (1/137) * [12, -75, 200, -300, 300];

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
    x(:,i+r) = x(:,i+r-1) + h*y*(beta_pred.');
    % Evaluación-Corrección (EC)**m
    for j = 1:m
        x(:,i+r) = x(:,i:i+r-1)*(alpha_corr.') + 60*h*f(t(i+r),x(:,i+r));
    end
    % Evaluación
    y = [y(:,2:r), f(t(i+r), x(:,i+r))];
end

t=t(:); % Convertimos t en vector columna del tipo (N+1,1)
x=x.';  % Convertimos la matriz x en una del tipo (N+1,n)