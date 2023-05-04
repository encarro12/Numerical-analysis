function my_plot(t1, t2, x1, x2, index)

dim = size(x1,2);
%dibujamos las componentes en diferentes subplots para diferentes posibles
%dims
figure(2*index - 1)
for i=1:dim
    subplot(dim,1,i)
    plot(t1,x1(:,i),'r')
    hold on;
    plot(t2,x2(:,i),'b')
    %sprintf nos permite añadir valor de variables a texto (no como en
    %disp)
    s = sprintf('Coordenada %d de la solución',i);
    title(s)
end

%a continuación distinguimos casos para dibujar trayectorias en caso de
%dimensión 2 o 3 (variables frente a otras)

if dim > 1
    pause(3) %para que de tiempo a visualizar la primera figura
    figure(2*index)
    if (dim == 2)
        plot(x1(:,1),x1(:,2),'r')
        hold on;
        plot(x2(:,1),x2(:,2),'b')
    elseif (dim == 3)
        plot3(x1(:,1),x1(:,2),x1(:,3),'r')
        hold on;
        plot3(x2(:,1),x2(:,2),x2(:,3),'b')
    end
    title('Trayectoria de la solución')
end