%% Load results
load('../results/task1/nis.mat');
load('../results/task1/y.mat');
load('../results/task1/z.mat');
load('../results/task1/ybar.mat');

%% Extract variables
time = nis(1, :); time = time(:);
nis = nis(2,:); nis = nis(:);
y = y(2:3,:);
z = z(2:3,:);
ybar = ybar(2:3,:);

M = 2;
N = length(nis);

%% Estimates
figure(1); clf;
subplot(2, 1, 1);
hold on;
plot(time, y(1,:), 'b', 'Linewidth', 1.2);
plot(time, ybar(1,:), 'g', 'Linewidth', 1.2);
ylabel('$\theta_{L1}$ [rad]', 'Interpreter', 'Latex', 'FontSize', 14);
xlabel('Time [s]', 'Interpreter', 'Latex', 'FontSize', 14);
legend('Measurement', 'Estimate', 'Interpreter', 'Latex');

subplot(2, 1, 2);
hold on;
plot(time, y(2,:), 'b', 'Linewidth', 1.2);
plot(time, ybar(2,:), 'g', 'Linewidth', 1.2);
ylabel('$\theta_{L2}$ [rad]', 'Interpreter', 'Latex', 'FontSize', 14);
xlabel('Time [s]', 'Interpreter', 'Latex', 'FontSize', 14);
legend('Measurement', 'Estimate', 'Interpreter', 'Latex');

sgtitle('Measurements and estimates', 'Interpreter', 'Latex', ...
    'Fontsize', 14);

%% Innovation sequence
innovs = y - ybar;

figure(2); clf;
subplot(2, 1, 1);
hold on;
plot(time, innovs(1,:), 'b', 'Linewidth', 1.2);
ylabel('$\tilde{\theta}_{L1}$ [rad]', 'Interpreter', 'Latex', 'FontSize', 14);
xlabel('Time [s]', 'Interpreter', 'Latex', 'FontSize', 14);

subplot(2, 1, 2);
hold on;
plot(time, innovs(2,:), 'b', 'Linewidth', 1.2);
ylabel('$\tilde{\theta}_{L2}$ [rad]', 'Interpreter', 'Latex', 'Fontsize', 14);
xlabel('Time [s]', 'Interpreter', 'Latex', 'FontSize', 14);

sgtitle('Sequence of innovations', 'Interpreter', 'Latex', ...
    'Fontsize', 14);

%% RMSE and max error
MSE = mean(sum(innovs.^2));
RMSE = sqrt(MSE);

fprintf('MSE: %f\n', MSE);
fprintf('RMSE: %f\n', RMSE);

%% Filter consistency - NIS sequence
alpha = 0.05;
CI2N = chi2inv([alpha/2, 1-alpha/2], M);
inCI = sum((nis >= CI2N(1)) .* (nis <= CI2N(2)))/N * 100;

titleString = sprintf('Sequence of NISes (%.1f\\%% inside %.1f\\%%-CI)', ...
    inCI, (1-alpha)*100);

figure(3); clf;
hold on;
plot(time, nis, 'b', 'Linewidth', 1.2);
plot([time(1), time(end)], repmat(CI2N',[1,2])', 'r--', 'Linewidth', 2)
title(titleString, 'Interpreter', 'Latex', 'FontSize', 14);
ylabel('NIS [-]', 'Interpreter', 'Latex', 'FontSize', 14);
xlabel('Time [s]', 'Interpreter', 'Latex', 'FontSize', 14);
legend('NIS', 'Conf. int. bounds', 'Interpreter', 'Latex');