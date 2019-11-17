load('../results/modeProbabilitiesSS.mat')
load('../results/modeProbabilitiesTV.mat')

figure(1);
subplot(2,1,1);
hold on;
plot(modeProbsSS(1,:), modeProbsSS(2,:));
plot(modeProbsSS(1,:), modeProbsSS(3,:));
plot(modeProbsSS(1,:), modeProbsSS(4,:));

subplot(2,1,2);
hold on;
plot(modeProbsTV(1,:), modeProbsTV(2,:));
plot(modeProbsTV(1,:), modeProbsTV(3,:));
plot(modeProbsTV(1,:), modeProbsTV(4,:));