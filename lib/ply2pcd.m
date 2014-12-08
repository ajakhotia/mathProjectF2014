function ply2pcd(readName,writeName)
%% Converts ply files to pcd file for easy visualization.
% readName - .ply file that needs to be read
% writeName - .pcd file that the data needs to be written to.
addPaths;
[vertex,~] = read_ply(filename)
keyboard;
end