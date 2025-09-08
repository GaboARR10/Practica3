% Función que resuelve numericamente el sistema %
[t, w] = ode45(@Prac3, [0 10], [0 0 0 0]);

% Aqui se crea la figura donde se va a graficar

figure(1)
plot(t,w);
xlabel('Tiempo (s)');
ylabel('Desplazamiento (m)');
title('Respuesta del sistema con entrada z_1');
commonY = [-0.15 0.15];            % mismo rango para todas
yt = -0.15:0.05:0.15;              % mismas marcas
ylim(commonY); yticks(yt); ytickformat('%.2f');
grid on;

% Función que resuelve numericamente el sistema %
[t, w] = ode45(@main_prac3, [0 10], [0 0 0 0]);

% Aqui se crea la figura donde se va a graficar

figure(2)
plot(t,w);
xlabel('Tiempo (s)');
ylabel('Desplazamiento (m)');
title('Respuesta del sistema con entrada z_2');
ylim([-0.5 0.5]); % Ajuste del eje Y
grid on;
