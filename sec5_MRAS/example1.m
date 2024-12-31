%% Example 5.1 Adaptation of a feedforward gain
%% Setting > Solver
start_time = 0.0;
stop_time = 20.0;
sample_time = 0.01;

%% Parameter
k = 1;
k0 = 2;
lambda = 1;

%% Process and Reference output
S = sim('MIT_feedforward.slx');
figure
LW = 2; % Line Width
plot(S.Ym.Time, S.Ym.Data, 'b--', 'LineWidth', LW)
hold on
plot(S.Y.Time, S.Y.Data, 'r-', 'LineWidth', LW)
hold off
grid on
xlabel('time')
ylabel('output')
legend('ym', 'y')
%% Parameter convergence with differnce lambda
figure
hold on
LW = 2; % Line Width
Lambda = [0.5 1 2];
for i = 1:3
    lambda = Lambda(i);
    S = sim('MIT_feedforward.slx');
    plot(S.Theta.Time, S.Theta.Data, 'LineWidth', LW)
end
plot(S.k.Time, k0./S.k.Data, 'k--', 'LineWidth', LW)
hold off
grid on
xlabel('time')
ylabel('theta')
legend({'$\lambda = 0.5$', '$\lambda = 1$', '$\lambda = 2$'},'Interpreter','latex')

%%

