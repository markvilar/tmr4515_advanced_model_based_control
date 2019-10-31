%% Load control plant model
ctrlPlantModel = load('ctrlPlantModel.mat');
Ac = ctrlPlantModel.A;
Bc = ctrlPlantModel.B;
Gc = ctrlPlantModel.G;
Cc = ctrlPlantModel.C;

ctrlPlantModel1 = load('ctrlPlantModel1.mat');
Ac1 = ctrlPlantModel1.A;
Bc1 = ctrlPlantModel1.B;
Gc1 = ctrlPlantModel1.G;
Cc1 = ctrlPlantModel1.C;

ctrlPlantModel2 = load('ctrlPlantModel2.mat');
Ac2 = ctrlPlantModel2.A;
Bc2 = ctrlPlantModel2.B;
Gc2 = ctrlPlantModel2.G;
Cc2 = ctrlPlantModel2.C;

ctrlPlantModel3 = load('ctrlPlantModel3.mat');
Ac3 = ctrlPlantModel3.A;
Bc3 = ctrlPlantModel3.B;
Gc3 = ctrlPlantModel3.G;
Cc3 = ctrlPlantModel3.C;

%% Covariance matrices and priors
% Process and measurement noise covariances
IW1 = 1;
IW2 = 1;
IThetaL1 = 10^(-6);
IThetaL2 = 10^(-6);

% Variance = Intensity / Sampling time (approximation)
D = [IW1 0; 0 IW2] / Ts;
R = [IThetaL1 0; 0 IThetaL2] / Ts; % Little uncertain about this one

% Prior
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0;];
P0 = diag([1, 1, 1, 1, 10, 10, 10, 10, 1, 1].^2);

%%
[Ad, Bd, Qd] = VanLoan(Ac, Bc, Gc, D, Ts);
[Ad1, Bd1, Qd1] = VanLoan(Ac1, Bc1, Gc1, D, Ts);
[Ad2, Bd2, Qd2] = VanLoan(Ac2, Bc2, Gc2, D, Ts);
[Ad3, Bd3, Qd3] = VanLoan(Ac3, Bc3, Gc3, D, Ts);
Rd = R;