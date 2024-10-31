%% Example 2.14  Closed-loop estimation
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
c = 0;

% Estimator
lambda = 1;

% Noise
std_e = 0.5;
mean_e = 0;
seed_e = 2;

% Initial Condition
y0 = 0;
P0 = 100 * eye(2);
theta0 = zeros(2,1);


%% Plot

Lambda = [1, 0.999, 0.99, 0.95];
line_width = 3;
figure
for i = 1:4
    lambda = Lambda(i);
    S = sim("RLS_forgetting_factor.slx");
    subplot(2,2,i)
    plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', line_width)
    hold on
    plot([start_time, stop_time/2, stop_time/2 stop_time], [a, a, -a, -a], 'b--', 'LineWidth', 2)
    plot(S.theta.Time, S.theta.Data(:,2), 'r', 'LineWidth', line_width)
    plot([start_time, stop_time], [b, b], 'r--', 'LineWidth', 2)
    hold off
    grid on
    title(['lambda = ', num2str(lambda)])
    legend({'$\hat{a}$','$a$','$\hat{b}$','$b$'},'Interpreter','latex')
end