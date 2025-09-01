% Ramirez Rojas Gabriel Alejandro
% 220477725     INRO

function dx = din_prac3(t, x, zfun)

    Parametros 
    m1 = 290;        
    m2 = 59;         
    b1 = 1000;       
    k1 = 16182;      
    k2 = 19000;      
    f  = 0;          

    x1 = x(1);  
    x2 = x(2);
    v1 = x(3);  
    v2 = x(4);

    % ===== Entrada de carretera =====
    z = zfun(t);  

    % ===== Ecuaciones =====
    a1 = ( -b1*v1 + b1*v2 - k1*x1 + k1*x2 + f ) / m1;
    a2 = (  b1*v1 - b1*v2 + k1*x1 - (k1+k2)*x2 - f + k2*z ) / m2;

    % ===== Vector derivadas =====
    dx = [v1; v2; a1; a2];
end
-------------------------------->
% Archivo principal: main_prac3.m
clc; clear; close all;

x0 = [0 0 0 0];

% Entradas de carretera
z1fun = @(t) 0.05*sin(0.5*pi*t);   % z1(t)
z2fun = @(t) 0.05*sin(20*pi*t);    % z2(t)

% ODE con z1
[t1, X1] = ode45(@(t,x) din_prac3(t, x, z1fun), [0 10], x0);

% ODE con z2
[t2, X2] = ode45(@(t,x) din_prac3(t, x, z2fun), [0 7],  x0);  % 0–7 como tus amigos

% Gráficas (desplazamientos solamente)
figure(1);

subplot(2,1,1);
plot(t1, X1(:,1), 'b', 'LineWidth', 1.5); hold on;
plot(t1, X1(:,2), 'r', 'LineWidth', 1.5); hold off;
title('Respuesta para z_1(t) = 0.05 sin(0.5\pi t)');
xlabel('Tiempo (s)'); ylabel('Desplazamiento (m)');
legend('x_1 (carrocería)','x_2 (rueda)','Location','best'); grid on;

subplot(2,1,2);
plot(t2, X2(:,1), 'b', 'LineWidth', 1.5); hold on;
plot(t2, X2(:,2), 'r', 'LineWidth', 1.0); hold off;
title('Respuesta para z_2(t) = 0.05 sin(20\pi t)');
xlabel('Tiempo (s)'); ylabel('Desplazamiento (m)');
legend('x_1 (carrocería)','x_2 (rueda)','Location','best'); grid on;
