figure(1); hold on;

% Dado el problema
mu = 50;
intervalo=[0,1];

% Cuya solución exacta es
exacta=@(t) [mu^2/(1 + mu^2)*(cos(t) - exp(-mu*t) + sin(t)/mu)];

% Aplicar el Método de Euler (implícito) a la resolución del problema
[t1,x1]=meulerim(intervalo,0,24,mu);
plot(t1,x1,'r');

[t2,x2]=meulerim(intervalo,0,25,mu);
plot(t2,x2,'b');