%matlab code for creating plots from simulation data run with friction

clc;
clear all;
close all;

stiffness_values = [100, 300, 1000, 3000, 10000];
cohesion_values = [0.01, 0.03, 0.1, 0.3];
e100g0value = 0.3318; %value for trial run with stiffness 100 and cohesion 0
data = [
    0.3453, 0.3789, 0.4855, 0.5391;   % E = 100
    0.3626, 0.3853, 0.4627, 0.5878;   % E = 300
    0.3718, 0.3943, 0.4437, 0.5574;   % E = 1000
    0.3843, 0.3977, 0.4362, 0.5311;   % E = 3000
    0.3948, 0.4026, 0.4383, 0.5072    % E = 10000
];

%contour plot
[X, Y] = meshgrid(log10(cohesion_values), log10(stiffness_values));
figure;
contourf(X, Y, log10(data-e100g0value), 'LineWidth', 1.5);
colorbar;
xlabel('log_{10}(Cohesion)');
ylabel('log_{10}(Stiffness)');

%line plots for each stiffness
figure;
for i = 1:length(stiffness_values)
    subplot(2, 3, i);
    semilogx((cohesion_values), data(i, :), '-o', 'LineWidth', 1.5);
    xlabel('log_{10}(Cohesion)');
    ylabel('Stress Ratio');
    title(['Stiffness = ' num2str(stiffness_values(i))]);
    grid on;
end

%line plots for each cohesion
figure;
for i = 1:length(cohesion_values)
    subplot(2, 2, i);
    semilogx(stiffness_values, data(:, i), '-o', 'LineWidth', 1.5);
    xlabel('log_{10}(Stiffness)');
    ylabel('Stress Ratio');
    title(['Cohesion = ' num2str(cohesion_values(i))]);
    grid on;
end