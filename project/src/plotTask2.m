%% Load data
load('../results/probsSS.mat') % SS hypothesis probabilities
load('../results/probsTV.mat') % TV hypothesis probabilities
load('../results/nisesSS.mat') % SS NISes
load('../results/nisesTV.mat') % TV NISes
load('../results/ybarsSS.mat') % SS measurement estimates
load('../results/ybarsTV.mat') % TV measurement estimates

%% Hypothesis probabilities
figure(1);
subplot(2,1,1);
hold on;
plot(probsSS(1,:), probsSS(2,:), 'r');
plot(probsSS(1,:), probsSS(3,:), 'g');
plot(probsSS(1,:), probsSS(4,:), 'b');
legend('Hypothesis 1', 'Hypothesis 2', 'Hypothesis 3');
title('Steady-state hypothesis probabilities');
xlabel('Time [s]');
ylabel('Probability [-]');

subplot(2,1,2);
hold on;
plot(probsTV(1,:), probsTV(2,:), 'r');
plot(probsTV(1,:), probsTV(3,:), 'g');
plot(probsTV(1,:), probsTV(4,:), 'b');
legend('Hypothesis 1', 'Hypothesis 2', 'Hypothesis 3');
title('Time-varying hypothesis probabilities');
xlabel('Time [s]');
ylabel('Probability [-]');