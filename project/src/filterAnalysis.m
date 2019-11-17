%% Load results
load('../results/NIS.mat');
load('../results/zNoise.mat');
load('../results/z.mat');
load('../results/zbar.mat');
NIS = NIS(2,:); NIS = NIS(:);
zNoise = zNoise(2,:); zNoise = zNoise(:);
z = z(2,:); z = z(:);
zbar = zbar(2,:); zbar = zbar(:);

M = 2;
N = length(NIS);

%% RMSE and max error
innovations = z - zbar;
MSE = mean(innovations.^2);
RMSE = sqrt(MSE);

fprintf('MSE: %f\n', MSE);
fprintf('RMSE: %f\n', RMSE);

%% Filter consistency
alpha = 0.05;
CI2N = chi2inv([alpha/2, 1-alpha/2], M);
inCI = sum((NIS >= CI2N(1)) .* (NIS <= CI2N(2)))/N * 100;

figure(2); clf;
plot(NIS); grid on; hold on;
ylabel('NIS');
plot([1,N], repmat(CI2N',[1,2])','r--')
title(sprintf('%.2f%% inside CI', inCI));
xlim([1 N]);