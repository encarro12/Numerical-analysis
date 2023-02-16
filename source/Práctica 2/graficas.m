%dibuja la gráfica de soluciones tras obtener el vector t y la matriz x de la
%aproximación de la solución aplicando la función ode45 de Matlab


dim = size(x,2);
color = ['r','g','b'];
%dibujamos las componentes en diferentes subplots para diferentes posibles
%dims
figure(1)
for i=1:dim
    subplot(dim,1,i)
    plot(t,x(:,i),color(i))
    %sprintf nos permite añadir valor de variables a texto (no como en
    %disp)
    s = sprintf('Coordenada %d de la solución',i);
    title(s)
end

%a continuación distinguimos casos para dibujar trayectorias en caso de
%dimensión 2 o 3 (variables frente a otras)

if dim > 1
    pause(3) %para que de tiempo a visualizar la primera figura
    figure(2)
    if (dim == 2)
        plot(x(:,1),x(:,2),'r')
    elseif (dim == 3)
        plot3(x(:,1),x(:,2),x(:,3),'r')
    end
    title('Trayectoria de la solución')
end