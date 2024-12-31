%% Example 5.1 Adaptation of a feedforward gain
clear, clc

%% Setting > Solver
start_time = 0.0;
stop_time = 100.0;
sample_time = 0.01;

%% Parameter
a = 1;
b = 0.5;
am = 2;
bm = 2;

%% lambda = 1
lambda = 1;
S = sim('MIT_first_order.slx');
% Plot
figure
LW = 2;

subplot(211)
plot(S.Ym.Time, S.Ym.Data, 'b-', 'LineWidth', LW)
hold on
plot(S.Y.Time, S.Y.Data, 'r-', 'LineWidth', LW)
hold off
grid on
ylim([-2 2])
legend({'$y_m$','$y$'}, 'Interpreter', 'latex')

subplot(212)
plot(S.U.Time, S.U.Data, 'b-', 'LineWidth', LW)
grid on
ylim([-5 5])
legend({'$u$'}, 'Interpreter', 'latex')

%% Different Adaptation Gain
Lambda = [5, 1, 0.2];

figure
LW = 2; % Line Width
subplot(211)
plot(S.Param.Time, bm./S.Param.Data(:,2), 'k--', 'LineWidth', LW)
ylabel('$\theta_1$', 'Interpreter', 'latex')
hold on
grid on

subplot(212)
plot(S.Param.Time, (am - S.Param.Data(:,1))/b, 'k--', 'LineWidth', LW)
ylabel('$\theta_2$', 'Interpreter', 'latex')
hold on
grid on

for i = 1:3
    lambda = Lambda(i);
    S = sim('MIT_first_order.slx');
    subplot(211)
    plot(S.Theta.Time, S.Theta.Data(:,1), 'LineWidth', LW)
    subplot(212)
    plot(S.Theta.Time, S.Theta.Data(:,2), 'LineWidth', LW)
end

subplot(211)
leg = legend('$\theta_1^0$', '$\lambda = 5$', '$\lambda = 1$', '$\lambda = 0.2$');
set(leg, 'Interpreter', 'latex')
hold off
subplot(212)
leg = legend('$\theta_1^0$', '$\lambda = 5$', '$\lambda = 1$', '$\lambda = 0.2$');
set(leg, 'Interpreter', 'latex')
hold off
%% Phase plane
stop_time = 500.0;
lambda = 1;
LW = 2;
S = sim('MIT_first_order.slx');
figure
plot(S.Theta.Data(:,1),S.Theta.Data(:,2), 'LineWidth', LW)
hold on
plot([1 4], [-1 2], 'k--', 'LineWidth', LW)
plot(4 ,2, 'ro', 'LineWidth', LW)
hold off
grid on
xlabel('$\theta_1$', 'Interpreter','latex')
ylabel('$\theta_2$', 'Interpreter','latex')
