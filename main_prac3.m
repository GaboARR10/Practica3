function dw = main_prac3(t, w)

%   DEFINICIÓN DE PARAMETROS  % 

m1 = 290;     % Kg
b1 = 1000;    % Ns/m
m2 = 59;      % Kg
k1 = 16182;   % N/m
f = 0;        % N
k2 = 19000;   % N/m
z1 = 0.05 * sin(0.5 * pi * t); % m
z2 = 0.05 * sin(20 * pi * t);  % m

% Inicializar dw
dw = zeros(4, 1);

% Representación en Espacio de Estados %

dw(1) = w(3);
dw(2) = w(4);
dw(3) = 1/m1 * (f + k1*w(2) - k1*w(1) + b1*w(4) - b1*w(3));
dw(4) = 1/m2 * (-f + k2*z2 - (k1 + k2)*w(2) + k1*w(1) - b1*w(4) + b1*w(3));  % Se usa z2
end
