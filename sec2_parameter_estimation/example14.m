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

%% Plot
Theta = [
    -2, 1;
    -2, 0;
    -2, -1;
    1, 1;
    1, 0;
    1, -1
    ]';
figure
hold on
for i = 1:6
    seed_e = i;
    theta0 = Theta(:,i);
    S = sim("closed_loop_estimation.slx");
    plot(S.theta.Data(:,1), S.theta.Data(:,2), 'b--')
    plot(S.theta.Data(end,1), S.theta.Data(end,2), 'o')
end
