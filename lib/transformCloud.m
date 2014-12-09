function transPointCloud = transformCloud(pointCloud,txQuat)
t = txQuat(1,1:3)';
R = q2dcm(txQuat(1,4:7));
T = [R,t;0 0 0 1];
tpc = T*[pointCloud;ones(1,size(pointCloud,2))];
transPointCloud = tpc(1:3,:);
end