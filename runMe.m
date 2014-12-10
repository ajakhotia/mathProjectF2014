%% Setup the environment
run(fullfile(pwd,'.\scripts\setupEnvironment.m'));

%% Setup parameters
numLoops = 1000;
tx = 0;
ty = 0;
tz = -0.5;
currR = eye(3);
currT = [tx;ty;tz];

%% Setup video
% Open video writer
vidname = 'tracking.avi';
vidout  = VideoWriter(vidname);
vidout.FrameRate = 5;
open(vidout);

%% Loop
for i=1:numLoops
    i
    %% Spoof camera
    % Sample a point from the trajectory of the bunny
    tic
    thX = pi/1.001*sin(3*i/numLoops);
    thY = 2*pi/1.001*sin(pi*i/numLoops);
    thZ = pi/1.001*sin(3*i/numLoops);
    
    Rx = [1 0 0; 0 cos(thX) -1*sin(thX); 0 sin(thX) cos(thX)];
    Ry = [cos(thX) 0 sin(thX); 0 1 0; -1*sin(thX) 0 cos(thX)];
    Rz = [cos(thX) -1*sin(thX) 0;sin(thX) cos(thX) 0; 0 0 1];
    %R = Rx*Ry*Rz;
    R = Ry;
    t = [tx;ty;tz];
    
    % Transform the bunny using the above R and t
    bunny = R*bunRes1 + repmat(t,1,size(bunRes1,2));
    visiblePointIndices = HPR(bunny',[0 0 0],3);
    bunny = bunny(:,visiblePointIndices);
    
    %% Get the previous pose
    prevR = currR;
    prevT = currT;
    
    %% Choose the template
    distMat = [];
    for rMatNum = 1:size(Rtrain,2)
        Rtr = reshape(Rtrain(:,rMatNum),3,3);
        distMat = [distMat,acos((trace((Rtr^-1)*prevR)-1)/2)];
    end
    [~,minInd] = min(distMat)
    template = templateCell{minInd};
        
    %% Transform the template
    templateTransformed = prevR*template + repmat(prevT,1,size(template,2));
    
    %% Perfrom ICP
    [delR,delT] = icp(bunny,templateTransformed,100,'Matching','kDtree','Minimize','plane');
    
    %% Compute the current pose
    currR = delR*prevR;
    currT = delT + delR*prevT;
    
    %% Compute the transformed template
    templateTransformed = currR*template + repmat(currT,1,size(template,2));
    
    %% Plot graphics
    figure(1);
    scatter3(bunny(1,1:3:end),bunny(2,1:3:end),bunny(3,1:3:end),'.k');
    hold on
    scatter3(templateTransformed(1,1:3:end),templateTransformed(2,1:3:end),templateTransformed(3,1:3:end),'.r');
    text(30,30,['Template: ' num2str(minInd)]);
    %axis([-0.4 -0.1 -0.2 0 -0.4 -0.15])
    hold off;
    drawnow;
    
    if(i==1 || i ==10 || i==65)
    dispCloud = [colorPointCloud(bunny,[0,0,1]),colorPointCloud(templateTransformed,[1,0,0])];
    pclviewer(dispCloud);
    end
    %% Write a frame to video, resized so that video will not be too big
	frm = getframe;
	writeVideo(vidout, frm.cdata);
    
end
%% Close video writer
close(vidout);
close(1);
fprintf('Video saved to %s\n', vidname);