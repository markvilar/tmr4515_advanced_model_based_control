%% Load control plant model
ctrlPlantModel = load('ctrlPlantModel.mat');
Ac = ctrlPlantModel.A;
Bc = ctrlPlantModel.B;
Gc = ctrlPlantModel.G;
Cc = ctrlPlantModel.C;

ctrlPlantModel1 = load('ctrlPlantModel1.mat');
Ac1 = ctrlPlantModel1.A;
sys1 = ctrlPlantModel1.sys;

ctrlPlantModel2 = load('ctrlPlantModel2.mat');
Ac2 = ctrlPlantModel2.A;
sys2 = ctrlPlantModel2.sys;

ctrlPlantModel3 = load('ctrlPlantModel3.mat');
Ac3 = ctrlPlantModel3.A;
sys3 = ctrlPlantModel3.sys;

%% Covariance matrices and priors
% Process and measurement noise covariances
IW1 = 1;
IW2 = 1;
IThetaL1 = 10^(-6);
IThetaL2 = 10^(-6);

% Variance = Intensity / Sampling time (approximation)
Q = [IW1 0; 0 IW2] / Ts;
R = [IThetaL1 0; 0 IThetaL2] / Ts; % Uncertain about this one
Rd = R / Ts;

% Prior
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];
P0 = diag([1, 1, 1, 1, 10, 10, 10, 10, 1, 1].^2);

%%
[Ad, Bd, Qd] = VanLoan(Ac, Bc, Gc, Q, Ts);
[Ad1, Bd1, Qd1] = VanLoan(Ac1, Bc, Gc, Q, Ts);
[Ad2, Bd2, Qd2] = VanLoan(Ac2, Bc, Gc, Q, Ts);
[Ad3, Bd3, Qd3] = VanLoan(Ac3, Bc, Gc, Q, Ts);
[~, W1, ~, ~, ~] = kalmd(sys1, Q, R, Ts);
[~, W2, ~, ~, ~] = kalmd(sys2, Q, R, Ts);
[~, W3, ~, ~, ~] = kalmd(sys3, Q, R, Ts);