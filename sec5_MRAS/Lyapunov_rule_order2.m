%% MRAS using Lyapunov for second order system
start_time = 0.0;
stop_time = 100.0;
sample_time = 0.01;

G = tf(1, [1 1 0]);
A = [0 1; 0 1];
B = [0; 1];
C = [1, 0];
D = 0;

Am = [0 1; -2 -3];
Bm = [0; 2];

P = 10*eye(2);