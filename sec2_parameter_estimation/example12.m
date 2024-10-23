%% Simulation of Recuresive Estimation
start_time = 0;
stop_time = 1000;
sample_time = 1;

% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
c = 0;

% A(q) y(t) = B(q) u(t) + C(1) e(t)
A = [1, a];
B = b;
C = [1, c];

% noise parameter
std_e = 0.5;
mean_e = 0;
seed_e = 6;

P0 = 100 * eye(2);
theta0 = zeros(2,1);