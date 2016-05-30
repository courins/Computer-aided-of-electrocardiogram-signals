function [max_list] = pan_tompkins( ecg,list,delay )
% return a array of two lines : 
% The max values are on the first line
% The index of each max on the second line

max_list=[];

for i = 1:length(list)
     [max_value,max_index]=max( ecg( list(1,i) : list(2,i) ) );
     max_list(1,i)=list(1,i)+max_index-delay;
     max_list(2,i)=max_value;
end 

end

