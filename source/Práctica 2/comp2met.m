function comp2met(metodo1, metodo2)
datos
[t, x1] = metodo1(f, intervalo, x0, N);
[~, x2] = metodo2(f, intervalo, x0, N);

colx=size(x1,2); % Número de columnas de la matriz x

x = x1 - x2;
figure(1)
color=['r','g','b'];
for i=1:colx
    subplot(colx,1,i)
    plot(t,x(:,i),color(i))
    s=sprintf('Coordenada %d de la solución de la diferencia',i);
    title(s)
end



figure(2)
for i=1:colx
    subplot(colx,1,i)
    plot(t,x1(:,i),'r', t,x2(:,i),'b')
    s=sprintf('Coordenada %d de la solución',i);
    title(s)
end
if colx>1
    pause(3)
    figure(3)
    if colx==2
        plot(x1(:,1),x1(:,2),'r', x2(:,1),x2(:,2),'b')
    else
        plot3(x1(:,1),x1(:,2),x1(:,3),'r', x2(:,1),x2(:,2),x2(:,3),'b')
    end
    title('Trayectoria de la solución')


end