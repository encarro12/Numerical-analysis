% Fijamos las condiciones iniciales y parámetros
alpha = 1;
beta = 1;
T = 10;
x0 = 0.1;
v0 = 0.2;

% Definimos funcion f(t,x) de la ecuación diferencial del PVI
f = @(t,x) [x(2); -alpha*(x(1)^2 - beta)*x(2) - x(1)];

% Aplicamos la función ode45 para obtener la solución
[t,x] = ode45(f, [0, T], [x0,v0]);

% Dibujamos la aproximacion de la solución
figure(1);
subplot(2,1,1);
plot(t, x(:,1));
subplot(2,1,2);
plot(t,x(:,2));
figure(2);
plot(x(:,1),x(:,2));