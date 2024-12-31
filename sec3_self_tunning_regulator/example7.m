%% Example 3.7 Direct self-tuner with d0 = 1
clear, clc

%% Setting > Solver
t_0 = 0.0;
t_f = 500.0;
dt = 0.5;
%%
% Process model
G = tf(1,[1 1 0]);
h = 0.5;
H = c2d(G,h);
A = H.Denominator{1};
B = H.Numerator{1};

% Reference model
z = 0.7;
w = 1;
Gm = tf(w^2, [1, 2*z*w, w^2]);
Hm = c2d(Gm, h, 'impulse');
Am = Hm.Denominator{1};
Bm = sum(Am);
A0 = 1;
d0 = 2;
l = 1;

theta0 = [1 0 0 0]';
P0 = 10*eye(4);
