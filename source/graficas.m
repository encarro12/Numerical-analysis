% Si la ecuación diferencial es escalar se dibuja la gráfica de la
% solución, de color rojo
if size(x) == 1
    plot(t,x,'r')
    legend('x(t)')
    title('EDO escalar')
elseif size(x) == 2
    subplot(2,1,1)
    plot(t,x(:,1))
    subplot(2,1,2)
    plot(t,x(:,2))
    legend('x1(t), x2(t)')
    title('EDO R2')
    pause(5)
    plot(x(:,1),x(:,2))
else
    subplot(3,1,1)
    plot(t,x(:,1),'r')
    subplot(3,1,2)
    plot(t,x(:,2),'g')
    subplot(3,1,3)
    plot(t,x(:,3),'b')
    legend('x1(t), x2(t), x3(t)')
    title('EDO R3')
    pause(5)
    plot(x(:,1),x(:,2),x(:,3))
end
    