%% Example 3.6 Continuous-time self-tuner
%% Setting > Solver
start_time = 0.0;
stop_time = 100.0;
sample_time = 0.01;

%% Parameter
W = 1;
Z = 0.7;

a = 1;
b = 1;

%%
S = sim('Continuous_Time_STR.slx');
%%
figure
LW = 2;

subplot(211)
plot(S.Uc.Time, S.Uc.Data, 'LineWidth', LW)
hold on
plot(S.Y.Time, S.Y.Data, 'LineWidth', LW)
hold off
grid on
legend('uc', 'y')

subplot(212)
plot(S.U.Time, S.U.Data, 'LineWidth', LW)
grid on
ylim([-2 2])
legend('u')

%% 
figure
LW = 2;
plot(S.Theta.Time, S.Theta.Data(:,1), 'LineWidth', LW)
hold on
plot(S.Theta.Time, S.Theta.Data(:,2), 'LineWidth', LW)
plot([start_time, stop_time], [1 1], 'k--', 'LineWidth', LW)
hold off
grid on
legend('a', 'b')



