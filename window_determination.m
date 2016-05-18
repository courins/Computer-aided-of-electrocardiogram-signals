function [window_length] = window_determination(ecg, threshold)

% Give the integer just under the mean width of the QRS complex

%Input :
%ecg : electrical cardiogram
%Threshold separates R wave from the rest.

%Output :
%window_length : interger just under mean width of the QRS complex.

ecg_tmp = (ecg > threshold).*ecg;

window_length = 0;
number_of_waves = 0;

i = 1;
while i<length(ecg_tmp)
    if ecg_tmp(i) ~= 0
        j = 1;
        while ecg_tmp(i+(j-1)) ~= 0 && (i+(j-1)) < length(ecg_tmp)
            j = j + 1; 
        end
        window_length = window_length + j; 
        number_of_waves = number_of_waves + 1;
        i = i + j;
    end
    i = i + 1;
    
end

number_of_waves = number_of_waves/2;
window_length = floor(window_length/number_of_waves);

end