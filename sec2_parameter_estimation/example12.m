%% Simulation of Recuresive Estimation
clear, clc
%% Model Settings > Solver
start_time = 0;
stop_time = 1000;
sample_time = 1;

%% Parameters
% Model
% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
c = -0.5;

% A(q) y(t) = B(q) u(t) + C(q) e(t)
A = [1, a];
B = b;
C = [1, c];

% Noise
std_e = 0.5;
mean_e = 0;
seed_e = 6;

% Initial
P0 = 100 * eye(3);
theta0 = zeros(3,1);
%% Simulation
% input_type: {(1, 'unit pulse'), (2, 'periodic pulse')}
input_type = 2;
% regressor_type: {(1, 'rls'), (2, 'els')}
regressor_type = 2;
data = sim("recursive_estimation.slx");
%% Plot
line_width = 3;

figure
plot(data.theta.Time, data.theta.Data(:,1), 'b-', 'LineWidth', line_width)
hold on, grid on
plot([start_time stop_time], [a a], 'b--', 'LineWidth', line_width)
plot(data.theta.Time, data.theta.Data(:,2), 'r-','LineWidth',line_width)
plot([start_time stop_time], [b b], 'r--', 'LineWidth', line_width)
plot(data.theta.Time, data.theta.Data(:,3), 'g-','LineWidth',line_width)
plot([start_time stop_time], [c c], 'g--', 'LineWidth', line_width)
xlabel('Sample')
legend({'$\hat{a}$','$a$','$\hat{b}$','$b$','$\hat{c}$','$c$'},'Interpreter','latex')
