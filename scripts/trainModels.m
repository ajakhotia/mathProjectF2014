%% Clear the environment
clear all;
clc;

%% Declare the angles
th = [0 pi/4 pi/2 pi 3*pi/2 7*pi/4];
Rtrain = [];

%% Declare path
savePath = fullfile('..','data','bunny','pcd','templates','Rtrain.mat');

%% Loop and generate rotation matrices
for i = 1:size(th,2);
    ang = -1*th(i);
    R = [cos(ang) 0 sin(ang);0 1 0; -1*sin(ang) 0 cos(ang)];
    Rtrain = [Rtrain,R(:)];
end
save(savePath,'Rtrain');