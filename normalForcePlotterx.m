%matlab code for plotting stress values from readings taken of the moving top wall and calculating stress ratio 

clear all;
close all;
clc;

%opening and reading files with stress readings
fileID1 = fopen('px.txt', 'r'); %stress along shear direction
fileID2 = fopen('py.txt', 'r'); %stress perpendicular to both shearing and normal
fileID3 = fopen('pz.txt', 'r'); %stress normal to the moving wall

data1 = textscan(fileID1, '%f', 'CommentStyle', '#');
fclose(fileID1);
data2 = textscan(fileID2, '%f', 'CommentStyle', '#');
fclose(fileID2);
data3 = textscan(fileID3, '%f', 'CommentStyle', '#');
fclose(fileID3);

data1 = data1{1}; %extracting numerical data
data2 = data2{1};
data3 = data3{1};

%plotting stress along shearing direction
figure(1);
plot(data1, 'o-');
title('Shear Stress');
xlabel('Time Step');
ylabel('Stress');
ylim([-200 200]);
grid on;
%plotting stress perpendicular to shearing and normal
figure(2);
plot(data2, 'o-');
title('Y-Stress');
xlabel('Time Step');
ylabel('Stress');
ylim([-50 50]);
grid on;
%plotting stress normal to moving wall
figure(3);
plot(data3, 'o-');
title('Normal Stress');
xlabel('Time Step');
ylabel('Stress');
ylim([-100 150]);
grid on;


%calculating the average value of the last 25% of the data
last_25_percent_size = ceil(0.25 * length(data1));
last_25_percent_data = data1(end - last_25_percent_size + 1:end);
pload = 100; %for recording a nondimensionalized value 
average_last_25_percent = (mean(last_25_percent_data)/pload);
fprintf('mu: %.4f\n', average_last_25_percent);

