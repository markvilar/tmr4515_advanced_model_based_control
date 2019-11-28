%% General
clear all; close all; clc;
runSimulation = true;
simulationTime = 300;

%% Initialization of models
run('start_up.m');
run('initTask1.m');
run('initTask2.m');

%% Run
if runSimulation
    sim('simulation.slx', simulationTime);
end