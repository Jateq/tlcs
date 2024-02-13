% Define the transfer function
num = [1 3];
den = [1 6 11 6];
G = tf(num, den);

% Define the desired specifications
max_overshoot = 0.15;
settling_time = 2;

% Define the parameter ranges
K_range = 2:0.1:8;
a_range = 0.5:0.1:3.5;

% Initialize variables to store optimal values
optimal_overshoot = inf;
optimal_settling_time = inf;
optimal_K = NaN;
optimal_a = NaN;

% Loop through all parameter combinations
for K = K_range
    for a = a_range
        % Create the PID controller transfer function
        Gpid = tf([K*(a^2) K*2*a K], [1 0]);

        % Create the closed-loop system
        sys_cl = feedback(G*Gpid, 1);

        % Analyze the step response
        step_info = stepinfo(sys_cl);

        % Check if the current combination meets the specifications
        if step_info.Overshoot >= max_overshoot && step_info.SettlingTime <= settling_time
            % Update the optimal values
            if step_info.Overshoot < optimal_overshoot
                optimal_overshoot = step_info.Overshoot;
                optimal_settling_time = step_info.SettlingTime;
                optimal_K = K;
                optimal_a = a;
            end
        end
    end
end

% Display the results
initial_overshoot = stepinfo(feedback(G, 1)).Overshoot;
initial_settling_time = stepinfo(feedback(G, 1)).SettlingTime;

fprintf('Initial overshoot: %.2f\n', initial_overshoot);
fprintf('Initial settling time: %.2f\n', initial_settling_time);
fprintf('Optimal overshoot: %.2f\n', optimal_overshoot);
fprintf('Optimal settling time: %.2f\n', optimal_settling_time);
fprintf('Optimal value of K: %.2f\n', optimal_K);
fprintf('Optimal value of a: %.2f\n', optimal_a);
