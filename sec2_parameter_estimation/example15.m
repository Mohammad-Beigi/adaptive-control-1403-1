%% Example 2.15 Influence of forgetting factor
clear, clc

%% Model Settings > Solver
start_time = 0;
stop_time = 1000;
sample_time = 1;

%% Parameter

% System Parameters
% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
c = 0;

% Noise Parameters
e_mean = 0;
e_std = 0.5;
e_var = e_std^2;
e_seed = 2;

% Regressor vector
n_a = 1;
n_b = 1;
n_c = 0;
n_phi = n_a + n_b + n_c; % regressor dimension

%% Initial condition
P0 = 100;
theta0 = zeros(n_phi, 1);

%% Simulation
% System type
time_variant = true;

% Estimation Method:
% 1) Recursive Least Square (RLS)
% 2) Projection Algorithm (PA)
% 3) Stochastic Approximation (SA)
% 4) Least Mean Square (LMS)
estimation_method = 1;

% constant for PA method
alpha = 0.01;

% forgetting factors
Lambda = [1 0.999 0.99 0.95];

% Plot
line_width = 2;
figure
for i = 1:4
    lambda = Lambda(i);
    S = sim("different_estimation_methods.slx");
    subplot(4,1,i)
    plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
    hold on
    if time_variant
        plot([start_time, stop_time/2, stop_time/2, stop_time], [a, a, -a, -a], 'b--', 'LineWidth', 2)
    else
        plot([start_time, stop_time], [a, a], 'b--', 'LineWidth', 2)
    end
    plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
    plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
    hold off
    grid on
    title(['lambda = ', num2str(lambda)])
    legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')
end