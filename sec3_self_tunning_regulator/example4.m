%% Example 3.4
%% Model Settings > Solver
start_time = 0;
stop_time = 150;
sample_time = 0.5;

%% System Dynamic
% Continuous
G = tf(1,[1 1 0]);
% Descrete
h = 0.5;
H = c2d(G,h);
a = H.Denominator{1};
b = H.Numerator{1};
%% Regressor vector
n_a = 2;
n_b = 2;
n_c = 0;
n = n_a + n_b + n_c; % regressor dimension

%% Estimator
lambda = 0.95;

theta0 = [0; 0; 0.01; 0.2];
P0 = diag([100 100 1 1]);

%% Simulation
S = sim('Model_following.slx');


%% With Zero Cancellation
%% Plot Process output and Control input
figure
LW = 2;
subplot(211)
plot(S.Uc.Time, S.Uc.Data, 'LineWidth', LW)
hold on
plot(S.Y1.Time, S.Y1.Data, 'LineWidth', LW)
hold off
grid on
ylim([-2 2])
legend('uc', 'y')

subplot(212)
stairs(S.U1.Time, S.U1.Data, 'LineWidth', LW)
grid on
ylim([-5 5])
legend('u')

%% Plot model parameter
% a
figure
LW =2; % Line With
subplot(211)
stairs(S.Theta1.Time, S.Theta1.Data(:,1), 'b-', 'LineWidth',LW)
hold on
plot([start_time, stop_time], [a(2), a(2)], 'k--', 'LineWidth',LW)
stairs(S.Theta1.Time, S.Theta1.Data(:,2), 'r-', 'LineWidth',LW)
plot([start_time, stop_time], [a(3), a(3)], 'k--', 'LineWidth',LW)
hold off
grid on
leg = legend('$\hat{a}_1$','$a_1$','$\hat{a}_2$','$a_2$');
set(leg,'Interpreter','latex')

% b
subplot(212)
stairs(S.Theta1.Time, S.Theta1.Data(:,3), 'b-', 'LineWidth',LW)
hold on
plot(S.b1.Time, S.b1.Data, 'k--', 'LineWidth',LW)
stairs(S.Theta1.Time, S.Theta1.Data(:,4), 'r-', 'LineWidth',LW)
plot([start_time, stop_time], [b(3), b(3)], 'k--', 'LineWidth',LW)
hold off
grid on
leg = legend('$\hat{b}_0$','$b_0$','$\hat{b}_1$','$b_1$');
set(leg,'Interpreter','latex')


%% Without Zero Cancellation
%% Plot Process output and Control input
figure
LW = 2;
subplot(211)
plot(S.Uc.Time, S.Uc.Data, 'LineWidth', LW)
hold on
plot(S.Y2.Time, S.Y2.Data, 'LineWidth', LW)
hold off
grid on
ylim([-2 2])
legend('uc', 'y')

subplot(212)
stairs(S.U2.Time, S.U2.Data, 'LineWidth', LW)
grid on
ylim([-5 5])
legend('u')

%% Plot model parameter
% a
figure
LW =2; % Line With
subplot(211)
stairs(S.Theta2.Time, S.Theta2.Data(:,1), 'b-', 'LineWidth',LW)
hold on
plot([start_time, stop_time], [a(2), a(2)], 'k--', 'LineWidth',LW)
stairs(S.Theta2.Time, S.Theta2.Data(:,2), 'r-', 'LineWidth',LW)
plot([start_time, stop_time], [a(3), a(3)], 'k--', 'LineWidth',LW)
hold off
grid on
leg = legend('$\hat{a}_1$','$a_1$','$\hat{a}_2$','$a_2$');
set(leg,'Interpreter','latex')

% b
subplot(212)
stairs(S.Theta2.Time, S.Theta2.Data(:,3), 'b-', 'LineWidth',LW)
hold on
plot(S.b2.Time, S.b2.Data, 'k--', 'LineWidth',LW)
stairs(S.Theta2.Time, S.Theta2.Data(:,4), 'r-', 'LineWidth',LW)
plot([start_time, stop_time], [b(3), b(3)], 'k--', 'LineWidth',LW)
hold off
grid on
leg = legend('$\hat{b}_0$','$b_0$','$\hat{b}_1$','$b_1$');
set(leg,'Interpreter','latex')