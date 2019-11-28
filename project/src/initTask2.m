%% Load control plant models
ctrlPlantModel1 = load('../models/ctrlPlantModel1.mat');
Ac1 = ctrlPlantModel1.A;
Bc1 = ctrlPlantModel1.B;
Gc1 = ctrlPlantModel1.G;
sys1 = ctrlPlantModel1.sys;

ctrlPlantModel2 = load('../models/ctrlPlantModel2.mat');
Ac2 = ctrlPlantModel2.A;
sys2 = ctrlPlantModel2.sys;

ctrlPlantModel3 = load('../models/ctrlPlantModel3.mat');
Ac3 = ctrlPlantModel3.A;
sys3 = ctrlPlantModel3.sys;

%% Continuous time noise intensities
% Process white noise intensity
IW1 = 1;
IW2 = 1;

% Measurement white noise intensity
IThetaL1 = 10^(-6);
IThetaL2 = 10^(-6);

% Variance = Intensity / Sampling time (approximation)
Qn = [IW1 0; 0 IW2];
Rn = [IThetaL1 0; 0 IThetaL2];

%% Priors
% Prior state estimate
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];

% Prior covariance estimate
P0 = diag([1e-3, 1e-3, 1e-3, 1e-3, 1e-3, 1e-3, 1e-3, 1e-3, 1e-3, 1e-3].^2);

%% Discretization
[Ad1, Bd1, Qd1] = VanLoan(Ac1, Bc1, Gc1, Qn, Ts);
[Ad2, Bd2, Qd2] = VanLoan(Ac2, Bc1, Gc1, Qn, Ts);
[Ad3, Bd3, Qd3] = VanLoan(Ac3, Bc1, Gc1, Qn, Ts);
Rd = Rn / Ts;

[~, L1, P1, ~, ~] = kalmd(sys1, Qn, Rn, Ts);
[~, L2, P2, ~, ~] = kalmd(sys2, Qn, Rn, Ts);
[~, L3, P3, ~, ~] = kalmd(sys3, Qn, Rn, Ts);

%% DHT probability threshold
probThreshold = 1e-6;