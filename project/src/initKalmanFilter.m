%% Model
run('initCtrlPlantModel.m');


%% Kalman parameters

% Look at later
Q = eye(2);
R = 10^(-6)*eye(2);

%%
% Exact discretization
[~, Bd] = c2d(Ac, Bc, Ts);

% Discretization using van Loans method
M = Ts* [
    -Ac, Gc*Q*Gc';
    zeros(10,10), Ac';
    ];

N = expm(M);
Ad = N(11:20, 11:20)';
Qd = Ad*N(1:10, 11:20);