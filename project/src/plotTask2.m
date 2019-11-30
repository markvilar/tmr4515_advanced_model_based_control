%% Load data
load('../results/probsSS.mat') % SS hypothesis probabilities
load('../results/probsTV.mat') % TV hypothesis probabilities
load('../results/nisesSS.mat') % SS NISes
load('../results/nisesTV.mat') % TV NISes
load('../results/ybarsSS.mat') % SS measurement estimates
load('../results/ybarsTV.mat') % TV measurement estimates
load('../results/k2.mat')
load('../results/k5.mat')

%% Hypothesis probabilities
figure(1); clf;

subplot(3,1,1);
hold on;
plot(probsSS(1,:), probsSS(2,:), 'r','LineWidth',1.2);
plot(probsSS(1,:), probsSS(3,:), 'g','LineWidth',1.2);
plot(probsSS(1,:), probsSS(4,:), 'b','LineWidth',1.2);
legend('Hypothesis 1', 'Hypothesis 2', 'Hypothesis 3','Interpreter','latex','FontSize', 14);
title('Steady-state hypothesis probabilities','Interpreter','latex','FontSize', 14);
xlabel('Time [s]','Interpreter','latex','FontSize', 14);
ylabel('Probability [-]','Interpreter','latex','FontSize', 14);
set(gca,'FontSize',14);

subplot(3,1,2);
hold on;
plot(k2(1,:), k2(2,:), 'r','LineWidth',1.2);
legend('$k_2$','Interpreter','latex','FontSize', 14);
ylim([0,3]);
title('Parameter values','Interpreter','latex');
xlabel('Time [s]','Interpreter','latex','FontSize', 14);
ylabel('$k_2$ $[\frac{N}{rad}$]','Interpreter','latex','FontSize', 14);
set(gca,'FontSize',14);

subplot(3,1,3);
hold on;
plot(k5(1,:), k5(2,:), 'g','LineWidth',1.2);
legend('$k_5$','Interpreter','latex','FontSize', 14);
ylim([0,3]);
xlabel('Time [s]','Interpreter','latex','FontSize', 14);
ylabel('$k_5$ [$\frac{N}{rad}$]','Interpreter','latex','FontSize', 14);
set(gca,'FontSize',14);