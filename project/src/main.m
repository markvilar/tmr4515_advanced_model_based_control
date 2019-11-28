%% General
clear all; close all; clc;
runSimulation = true;

%% Initialization of models
run('start_up.m');
run('initTask1.m');
run('initTask2.m');

%% Run
if runSimulation
    run('simulation.slx');
end