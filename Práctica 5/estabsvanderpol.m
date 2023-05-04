datos;
% Aplicar la función ode45 para resolver el problema con alpha=0.1, T=150 
% con una TOL=1e-5

opciones=odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);
[t1,x1]=ode45(f,intervalo,x0,opciones);

% Aplicar la funcion ode15s para resolver el problema
opciones=odeset('Stats','off','AbsTol',1.e-5,'RelTol',1.e-5);
[t2,x2]=ode15s(f,intervalo,x0,opciones);

my_plot(t1, t2, x1, x2, 1)

% Representar los pasos considerados en cada uno de los métodos
h1 = diff(t1);
h2 = diff(t2);

figure(5);
plot(1:1:size(h1), h1, 'r')
hold on;
plot(1:1:size(h2), h2, 'b')

legend( ...
    sprintf('ode45 | Pasos: %d',length(t1)), ...
    sprintf('ode15s | Pasos: %d',length(t2)));
