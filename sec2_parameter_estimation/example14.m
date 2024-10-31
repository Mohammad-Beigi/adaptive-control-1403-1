%% Example 2.14  Closed-loop estimation
clear, clc

%% Model Settings > Solver
start_time = 0;
stop_time = 20000;
sample_time = 1;

%% Parameters
% Model
% y(t) + a y(t-1) = b u(t-1) + e(t) + c e(t-1)
a = -0.8;
b = 0.5;
c = 0;

% Noise
std_e = 0.5;
mean_e = 0;
seed_e = 2;

% Initial Condition
y0 = 0;
P0 = 0.01 * eye(2);
theta0 = zeros(2,1);

% Controller
K = [0.2, 0.32];

%%
S = sim("closed_loop_estimation.slx");

LW = 2; % Line Width
figure
plot(S.theta.Time, S.theta.Data(:,1), 'b', 'LineWidth', LW)
hold on
plot([start_time stop_time], [a a], 'b--', 'LineWidth', LW)
plot(S.theta.Time, S.theta.Data(:,2), 'r','LineWidth', LW)
plot([start_time stop_time], [b b], 'r--', 'LineWidth', LW)
hold off
grid on
legend({'$\hat{a}$', '$a$', '$\hat{b}$', '$b$'},'Interpreter','latex')
xlabel('Sample Time')
%% Plot
LW = 2; % Line Width

Theta = [
    -1.75, 1;
    -1.5, 0;
    -1.25, -1;
    0, 1.5;
    0.25, 0.5;
    0.5, -0.5
    ]';

b_hat = [-1, 1.5];
a_hat = -K(1) * (b_hat - b) + a;

figure
%plot(a_hat, b_hat, 'k--', 'LineWidth', LW)
hold on
for i = 1:6
    seed_e = i;
    theta0 = Theta(:,i);
    S = sim("closed_loop_estimation.slx");
    plot(S.theta.Data(:,1), S.theta.Data(:,2), 'b', 'LineWidth', LW)
end
axis equal
hold off
grid on
xlabel({'$\hat{a}$'},'Interpreter','latex')
ylabel({'$\hat{b}$'},'Interpreter','latex')