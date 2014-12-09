%% Clear the environment
clear all;
clc;

%% Convert each of the ply files to pcd files
readFrom = fullfile('..','data','bunny','reconstruction');
writeTo = fullfile('..','data','bunny','pcd');

filesToRead = {'bun_zipper.ply';'bun_zipper_res2.ply';'bun_zipper_res3.ply';'bun_zipper_res4.ply'};
filesToWrite = {'bun_zipper.pcd';'bun_zipper_res2.pcd';'bun_zipper_res3.pcd';'bun_zipper_res4.pcd'};

for i = 1:size(filesToRead,1)
    [vertex,faces] = read_ply(fullfile(readFrom,filesToRead{i}));
    savepcd(fullfile(writeTo,filesToWrite{i}),vertex');
end