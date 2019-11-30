%% Load control plant model
ctrlPlantModel = load('../models/ctrlPlantModel.mat');
Ac = ctrlPlantModel.A;
Bc = ctrlPlantModel.B;
Gc = ctrlPlantModel.G;
Cc = ctrlPlantModel.C;

%% Continuous time noise intensities
% Process white noise intensity
IW1 = 1;
IW2 = 1;

% Measurement white noise intensity
IThetaL1 = 10^(-6);
IThetaL2 = 10^(-6);

% Continuous time noise intensity matrices
Qn = [IW1 0; 0 IW2];
Rn = [IThetaL1 0; 0 IThetaL2];

%% Priors
% Prior state estimate
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];

% Prior covariance estimate
P0 = diag([1e-1, 1e-1, 1e-1, 1e-1, 1e-1, 1e-1, 1e-1, 1e-1, 1e-1, 1e-1].^2);

%% Discretization
[Ad, Bd, Qd] = VanLoan(Ac, Bc, Gc, Qn, Ts);
Rd = Rn / Ts;