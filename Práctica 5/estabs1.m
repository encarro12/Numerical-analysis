% Dado el problema
mu = 50;
f=@(t,x) [-mu*(x - cos(t))]; intervalo=[0,1];

% Cuya solución exacta es
exacta=@(t) [mu^2/(1 + mu^2)*(cos(t) - exp(-mu*t) + sin(t)/mu)];

% Vamos dibujando a medida que calculamos las soluciones
figure(1);
fplot(exacta, [0,1], 'g'); hold on;

% Aplicar el Método de Euler (explícito) a la resolución del problema
[t1,x1]=meuler(f,intervalo,0,24);
plot(t1,x1,'r');

[t2,x2]=meuler(f,intervalo,0,25);
plot(t2,x2,'b');