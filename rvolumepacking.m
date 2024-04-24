%matlab code for calculating the solid packing fraction from the readings of the height of the moving top wall

clc;
clear all;
close all;

%opening particle data
fileID = fopen('shearing-2500000.data', 'r');
header_lines = textscan(fileID, '%s', 10, 'Delimiter', '\n');
header_lines = header_lines{1}; % Convert to cell array of strings
grain_data = textscan(fileID, '%d %d %f %f %f %f %f %f %f', 'HeaderLines', 1);
fclose(fileID);

%extracting grain properties
grain_types = grain_data{2};
radii = grain_data{3}./2; %extract radii of each grain
volumes = (4/3) * pi * radii.^3; %calculate volume of each grain

%filter grains of type 1 (flowing grains) to get total volume of flowing grains
type_1_indices = find(grain_types == 1);
type_1_volumes = volumes(type_1_indices);
total_volume_type_1 = sum(type_1_volumes); % sum up volumes of all grains of type 1
disp(['Total volume of grains of type 1: ' num2str(total_volume_type_1)]);


%opening moving wall height data
fileID2 = fopen('zpos.txt', 'r');
data2 = textscan(fileID2, '%f', 'CommentStyle', '#');
fclose(fileID2);
data2 = data2{1}; %height of moving top wall vs. time

%calculating average height of top wall in the last 25% of the simulation
last_25_percent_size = ceil(0.05 * length(data2));
last_25_percent_data = data2(end - last_25_percent_size + 1:end);
average_last_25_percent = mean(last_25_percent_data);
fprintf('zpos %.4f\n', average_last_25_percent);

%calculating solid packing fraction
d = 0.0008;
height = (average_last_25_percent)-(3*d)-(3*d);
volume = 20*d*10*d*height;
fprintf('volume %.4f\n', volume);
vpackfrac = total_volume_type_1/volume;
fprintf('volume packing fraction %.4f\n', vpackfrac);