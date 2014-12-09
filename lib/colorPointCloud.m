function [colouredPointCloud] = colorPointCloud( pointCloud, color )
if(size(color,1)<size(color,2))
    color = color';
end
colouredPointCloud = [pointCloud;repmat(color,1,size(pointCloud,2))];
end