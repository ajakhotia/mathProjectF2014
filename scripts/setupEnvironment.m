%% Clear the environment
clear all;
clc();

%% Add paths
addPaths;

%% Load the point clouds for bunny's complete model
bunRes1 = double(loadpcd('bun_zipper.pcd'));
bunRes2 = double(loadpcd('bun_zipper_res2.pcd'));
bunRes3 = double(loadpcd('bun_zipper_res3.pcd'));
bunRes4 = double(loadpcd('bun_zipper_res4.pcd'));

%% Load the templates
bun000 = double(loadpcd('bun000.pcd'));
bun045 = double(loadpcd('bun045.pcd'));
bun090 = double(loadpcd('bun090.pcd'));
bun180 = double(loadpcd('bun180.pcd'));
bun270 = double(loadpcd('bun270.pcd'));
bun315 = double(loadpcd('bun315.pcd'));
chin = double(loadpcd('chin.pcd'));
ear_back = double(loadpcd('ear_back.pcd'));
top2 = double(loadpcd('top2.pcd'));
top3 = double(loadpcd('top3.pcd'));
templateCell = {bun000;bun045;bun090;bun180;bun270;bun315};
load('Rtrain.mat');

%% Clear the screen
clc();