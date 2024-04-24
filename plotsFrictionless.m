%matlab code for creating plots from simulation data run without friction

clc;
clear all;
close all;

stiffness_values = [100, 300, 1000, 3000, 10000];
cohesion_values = [0.01, 0.03, 0.1, 0.3, 1, 3];
e100g0value = 0.0578; %value for trial run with stiffness 100 and cohesion 0
data = [
    0.0623, 0.0831, 0.1237, 0.2486, 1.2200, 5;   % E = 100, with placeholder value 5 for highest cohesion trial that failed
    0.0726, 0.0803, 0.1301, 0.1962, 0.5658, 3.0629;   % E = 300
    0.0772, 0.0892, 0.1182, 0.1827, 0.3538, 1.1535;   % E = 1000
    0.0801, 0.0840, 0.1105, 0.1780, 0.2908, 0.6839;   % E = 3000
    0.0859, 0.0934, 0.0957, 0.1551, 0.2566, 0.4819    % E = 10000
];

% Create contour plot
[X, Y] = meshgrid(log10(cohesion_values), log10(stiffness_values));
figure;
contourf(X, Y, log10(data-e100g0value), 'LineWidth', 1.5);
colorbar;
xlabel('log_{10}(Cohesion)');
ylabel('log_{10}(Stiffness)');

% Create line plots for each stiffness
figure; %separate since Stiffness = 100 is missing one data point
subplot(2, 3, 1);
semilogx(cohesion_values(1:5), data(1, 1:5), '-o', 'LineWidth', 1.5);
xlabel('log_{10}(Cohesion)');
ylabel('Stress Ratio');
title(['Stiffness = ' num2str(stiffness_values(1))]);
grid on;
for i = 2:length(stiffness_values)
    subplot(2, 3, i);
    semilogx((cohesion_values), data(i, :), '-o', 'LineWidth', 1.5);
    xlabel('log_{10}(Cohesion)');
    ylabel('Stress Ratio');
    title(['Stiffness = ' num2str(stiffness_values(i))]);
    grid on;
end

% Create line plots for each cohesion
figure;
for i = 1:length(cohesion_values)-1
    subplot(2, 3, i);
    semilogx(stiffness_values, data(:, i), '-o', 'LineWidth', 1.5);
    xlabel('log_{10}(Stiffness)');
    ylabel('Stress Ratio');
    title(['Cohesion = ' num2str(cohesion_values(i))]);
    grid on;
end
subplot(2, 3, 6); %separate since Cohesion = 3 is missing one data point
semilogx(stiffness_values(1:4), data(2:5, 6), '-o', 'LineWidth', 1.5);
xlabel('log_{10}(Stiffness)');
ylabel('Stress Ratio');
title(['Cohesion = ' num2str(cohesion_values(i))]);
grid on;