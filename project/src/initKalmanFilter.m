%% Model
run('start_up.m');
run('initCtrlPlantModel.m');

%% Kalman parameters

%
Q = eye(2);

% Look at later
Qd = eye(2);
Rd = eye(2);

% Prior
xbar = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];
Pbar = diag([1, 1, 1, 1, 10, 10, 10, 10, 1, 1].^2);

%%
% Exact discretization
[Ad, Bd] = c2d(Ac, Bc, Ts);
[~, Gd] = c2d(Ac, Gc, Ts);
Cd = Cc;

% Discretization using van Loans method
M = Ts* [
    -Ac, Gc*Q*Gc';
    zeros(10,10), Ac';
    ];

N = expm(M);
Advl = N(11:20, 11:20)';
Qdvl = Advl*N(1:10, 11:20);

%[kest, L, K, P, Z] = kalmd(sys, Q, R, Ts);