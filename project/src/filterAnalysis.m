%% Load results
load('../results/NIS.mat');
load('../results/zNoise.mat');
load('../results/z.mat');
load('../results/zbar.mat');
NIS = NIS(2,:)';
time = zNoise(1,:)';
zNoise = zNoise(2:3,:)';
z = z(2:3,:)';
zbar = zbar(2:3,:)';

M = 2;
N = length(NIS);

%% RMSE and max error
innovations = z - zbar;
MSE = mean(sum(innovations.^2,2));
RMSE = sqrt(MSE);

fprintf('MSE: %f\n', MSE);
fprintf('RMSE: %f\n', RMSE);

%% Filter consistency
alpha = 0.05;
CI2N = chi2inv([alpha/2, 1-alpha/2], M);
inCI = sum((NIS >= CI2N(1)) .* (NIS <= CI2N(2)))/N * 100;

figure(2); clf;
plot(time,NIS); grid on; hold on;
ylabel('NIS');
plot(time,repmat(CI2N',[1,N])','g--', 'LineWidth', .8)
title(sprintf('%.2f%% inside CI', inCI));
%xlim(time);

%% plots
figure(3);
plot(time, zNoise(:,1)); hold on;
plot(time, zbar(:,1), 'color', 'green')
title('θ_{L1}')
xlabel('time (s)')
ylabel('shaft angle (rad)')
legend('noisy measurement','estimate')

figure(4);
plot(time, zNoise(:,2)); hold on;
plot(time, zbar(:,2),'color', 'green')
title('θ_{L2}')
xlabel('time (s)')
ylabel('shaft angle (rad)')
legend('noisy measurement','estimate')

figure(5);
plot(time, innovations(:,1));
title('Innovations (residuals) θ_{L1}')
xlabel('time (s)')
ylabel('shaft angle (rad)')

figure(6);
plot(time, innovations(:,2));
title('Innovations (residuals) θ_{L2}')
xlabel('time (s)')
ylabel('shaft angle (rad)')

% figure(7)
% plot(time, (z(:,1)-zbar(:,1)).^2); hold on;
% title('squared θ_{L1} estimate error')
% xlabel('t')
% ylabel('')
% legend('')