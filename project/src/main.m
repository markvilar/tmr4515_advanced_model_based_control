%% General
clear all; close all; clc;
runSimulation = true;
simulationTime = 300;

%% Plant parameter events
k2Event = 1; % 1 = steps, 2 = sinus, 3 = constant
k5Event = 1; % 1 = steps, 2 = sinus, 3 = constant

%% Plant parameters
% Constants
k2Const = 2;
k5Const = 2;

% Step parameters
k2Value1 = 2;
k2Value2 = 1;
k2Value3 = 2;
k2Time1 = 100; % Switch time
k2Time2 = 200; % Switch time
k5Value1 = 2;
k5Value2 = 1.75;
k5Value3 = 1.25;
k5Time1 = 100; % Switch time
k5Time2 = 200; % Switch time

% Sinus parameters
k2Amp = 1; % Amplitude
k2Mean = 2; % Mean value
k2Freq = 0.05; % Frequency [rad/s]
k5Amp = 0.5; % Amplitude
k5Mean = 1.5; % Mean value
k5Freq = 0.05; % Frequency [rad/s]

%% Initialization of models
run('start_up.m');
run('initTask1.m');
run('initTask2.m');

%% Run simulation
if runSimulation
    sim('simulation.slx', simulationTime);
end