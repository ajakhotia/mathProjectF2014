%% Clear the environment
clear all;
clc();

%% Add paths
addPaths;

%% Load the point clouds for bunny's complete model
bunRes1 = loadpcd('bun_zipper.pcd');
bunRes2 = loadpcd('bun_zipper_res2.pcd');
bunRes3 = loadpcd('bun_zipper_res3.pcd');
bunRes4 = loadpcd('bun_zipper_res4.pcd');

%% Load the templates
bun000 = loadpcd('bun000.pcd');
bun045 = loadpcd('bun045.pcd');
bun090 = loadpcd('bun090.pcd');
bun180 = loadpcd('bun180.pcd');
bun270 = loadpcd('bun270.pcd');
bun315 = loadpcd('bun315.pcd');
chin = loadpcd('chin.pcd');
ear_back = loadpcd('ear_back.pcd');
top2 = loadpcd('top2.pcd');
top3 = loadpcd('top3.pcd');

%% Clear the screen
clc();