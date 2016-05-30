
function [position]=temporal_location(ecg,threshold)

len = length(ecg);
i=1;
point=1; %if point=1 it's the left point of the R peak and if point=2 it's the left
num=1; %num is the number of the R peak 
position =[];

while i<=len
    if ecg(i) >= threshold 
        
        point=1;%start by the left point
        position(point,num)= i; %take the position
        point=2;%then the right point
        
        while ecg(i) >= threshold && i<=len
        %moving the position until we get out of the peak/threshold
            i=i+1;

        end
        position(point,num)= i;
        num=num+1;
    end
    i=i+1;
end
%the position of the points are given in sample not seconds
end