%% Example 2.16   Different estimation methods
clear, clc

%% Model Settings > Solver
start_time = 0;
stop_time = 5000;
sample_time = 1;

%% Parameter

% System Parameters
% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
c = 0;
time_variant = false;

% Noise Parameters
e_mean = 0;
e_std = 0.5;
e_var = e_std^2;
e_seed = 2;

% Regressor vector
n_a = 1;
n_b = 1;
n_c = 1;
n_phi = n_a + n_b + n_c; % regressor dimension

%% Initial condition
theta0 = zeros(n_phi, 1);

%% Estimation Method:
% 1) Recursive Least Square (RLS)
% 2) Projection Algorithm (PA)
% 3) Stochastic Approximation (SA)
% 4) Least Mean Square (LMS)
%% RLS method
estimation_method = 1;
P0 = 100*eye(n_phi);
lambda = 1;

% Plot
line_width = 2;
S = sim("different_estimation_methods.slx");
subplot(2,2,1)
plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
hold on
plot([start_time, stop_time], [a, a], 'b--', 'LineWidth', 2)
plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
hold off
ylim([-1, 1])
grid on
title('RLS')
legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')

%% LMS method
estimation_method = 4;
lambda = 0.01;

% Plot
line_width = 2;
S = sim("different_estimation_methods.slx");
subplot(2,2,2)
plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
hold on
plot([start_time, stop_time], [a, a], 'b--', 'LineWidth', 2)
plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
hold off
ylim([-1, 1])
grid on
title('LMS')
legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')

%% PA method
estimation_method = 2;
alpha = 0.1;
lambda = 0.01;

% Plot
line_width = 2;
S = sim("different_estimation_methods.slx");
subplot(2,2,3)
plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
hold on
plot([start_time, stop_time], [a, a], 'b--', 'LineWidth', 2)
plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
hold off
ylim([-1, 1])
grid on
title('PA')
legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')

%% SA method
estimation_method = 3;
P0 = 0.01;
lambda = 0.2;

% Plot
line_width = 2;
S = sim("different_estimation_methods.slx");
subplot(2,2,4)
plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
hold on
plot([start_time, stop_time], [a, a], 'b--', 'LineWidth', 2)
plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
hold off
ylim([-1, 1])
grid on
title('SA')
legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')

