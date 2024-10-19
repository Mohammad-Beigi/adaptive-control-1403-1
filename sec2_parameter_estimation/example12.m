%% Simulation of Recuresive Estimation
start_time = 0;
stop_time = 100;
sample_time = 1;

% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
std_e = 0.5; % standard deviation of e(t)
mean_e = 0;
seed_e = 12;
c = 0;
P0 = 100;
theta0 = 0;