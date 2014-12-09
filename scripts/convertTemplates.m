%% Clear the environment
clear all;
clc;

%% Convert each of the ply files to pcd files
readFrom = fullfile('..','data','bunny','data');
writeTo = fullfile('..','data','bunny','pcd','templates');

filesToRead = {'bun000.ply';'bun045.ply';'bun090.ply';'bun180.ply';'bun270.ply';'bun315.ply';'chin.ply';'ear_back.ply';'top2.ply';'top3.ply'};
filesToWrite = {'bun000.pcd';'bun045.pcd';'bun090.pcd';'bun180.pcd';'bun270.pcd';'bun315.pcd';'chin.pcd';'ear_back.pcd';'top2.pcd';'top3.pcd'};

txQuat = [0 0 0 0 0 0 1; ...
    -0.0520211 -0.000383981 -0.0109223 0.00548449 -0.294635 -0.0038555 0.955586;...
    2.20761e-05 -3.34606e-05 -7.20881e-05 0.000335889 -0.708202 0.000602459 0.706009;...
    0.000116991 2.47732e-05 -4.6283e-05 -0.00215148 0.999996 -0.0015001 0.000892527;...
    0.000130273 1.58623e-05 0.000406764 0.000462632 0.707006 -0.00333301 0.7072;...
    -0.00646017 -1.36122e-05 -0.0129064 0.00449209 0.38422 -0.00976512 0.923179;...
    0.00435102 0.0882863 -0.108853 -0.441019 0.213083 0.00705734 0.871807;...
    -0.0829384 0.0353082 0.0711536 0.111743 0.925689 -0.215443 -0.290169;...
    -0.0530127 0.138516 0.0990356 0.908911 -0.0569874 0.154429 0.383126;...
    -0.0277373 0.0583887 -0.0796939 0.0598923 0.670467 0.68082 -0.28874];
fullCloud = [];
for i = 1:size(filesToRead,1)
    [vertex,faces] = read_ply(fullfile(readFrom,filesToRead{i}));
    transCloud = transformCloud(vertex',txQuat(i,:));
    savepcd(fullfile(writeTo,filesToWrite{i}),transCloud);
    fullCloud = [fullCloud,colorPointCloud(transCloud,rand(1,3))];
end
pclviewer(fullCloud);