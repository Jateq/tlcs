clear all; clc; close all;
% Given transfer function coefficients
numerator = 29.64;
denominator = [0.0056, 0.207, 1.33, 30.64];

% Define a range of K values
K_values = logspace(-2, 2, 100); % Adjust the range as needed

% Initialize arrays to store stability information
stability_info = zeros(size(K_values));

% Loop through each K value
for i = 1:length(K_values)
    % Construct the transfer function with the current K value
    sys = tf(numerator * K_values(i), denominator);

    % Calculate the Nyquist plot
    [mag, ~] = bode(sys);

    % Check stability based on the Nyquist plot
    stability_info(i) = all(real(squeeze(mag)) < 1);
end

% Find stable and unstable regions
stable_ranges = find(stability_info);
unstable_ranges = find(~stability_info);

% Print the results
fprintf('Stable regions: %f < K < %f\n', K_values(stable_ranges([1 end])));
fprintf('Unstable regions: %f < K < %f\n', K_values(unstable_ranges([1 end])));
