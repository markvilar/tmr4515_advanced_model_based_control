%% Load control plant model
ctrlPlantModel = load('../models/ctrlPlantModel.mat');
Ac = ctrlPlantModel.A;
Bc = ctrlPlantModel.B;
Gc = ctrlPlantModel.G;
Cc = ctrlPlantModel.C;

%% Covariance matrices
% Process white noise intensity
IW1 = 1;
IW2 = 11;

% Measurement white noise intensity
IThetaL1 = 10^(-6);
IThetaL2 = 10^(-6);

% Variance = Intensity / Sampling time (approximation)
Qn = [IW1 0; 0 IW2]; % Little uncertain about this one!
Rn = [IThetaL1 0; 0 IThetaL2];
Rd = Rn / Ts; % This is right! Leads to filter consistency!

%% Priors
% Prior state estimate
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];

% Prior covariance estimate
P0 = diag([1, 1, 1, 1, 1, 1, 1, 1, 1, 1].^2);

%% Discretization
[Ad, Bd, Qd] = VanLoan(Ac, Bc, Gc, Qn, Ts);