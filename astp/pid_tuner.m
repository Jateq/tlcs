clear; clc; close all;

num = [1];
den = [47.55, 1.81];
G = tf(num, den);

disp('Plant Transfer Function G(s):');
disp(G);

C_P = pidtune(G, 'P');
C_PI = pidtune(G, 'PI');
C_PID = pidtune(G, 'PID');

C_PI.Kp = 18.55;
C_PI.Ki = 0.706;

fprintf('Autotuned P Controller: Kp = %.4f\n', C_P.Kp);
fprintf('Autotuned PI Controller: Kp = %.4f, Ki = %.4f\n', C_PI.Kp, C_PI.Ki);
fprintf('Autotuned PID Controller: Kp = %.4f, Ki = %.4f, Kd = %.4f\n', C_PID.Kp, C_PID.Ki, C_PID.Kd);

CL_P = feedback(C_P * G, 1);
CL_PI = feedback(C_PI * G, 1);
CL_PID = feedback(C_PID * G, 1);

t = 0:1:100;

[yP, tP] = step(CL_P, t);
[yPI, tPI] = step(CL_PI, t);
[yPID, tPID] = step(CL_PID, t);

Kp_custom = 18.55;
Ki_custom = 0.706;

C_custom_PI = pid(Kp_custom, Ki_custom);
CL_custom_PI = feedback(C_custom_PI * G, 1);
[y_custom_PI, t_custom_PI] = step(CL_custom_PI, t);

figure;
hold on;
grid on;
title('Step Responses of P, PI, and PID Controllers');
xlabel('Time (s)');
ylabel('Response');
axis([0 10 0 1.5]);

colors = {'r', 'g', 'b'};
controllers = {'P', 'PI', 'PID'};
responses = {CL_P, CL_PI, CL_PID};
y_responses = {yP, yPI, yPID};
t_responses = {tP, tPI, tPID};
step_infos = cell(1,3);

for i = 1:3
    plot(t_responses{i}, y_responses{i}, 'Color', colors{i}, 'LineWidth', 1.5, 'DisplayName', [controllers{i} ' Controller']);
    step_infos{i} = stepinfo(responses{i});
    y_offset = 0.05 * i;
    
    plot(step_infos{i}.RiseTime, 1, [colors{i} 'o'], 'MarkerFaceColor', colors{i}, 'DisplayName', [controllers{i} ' Rise Time']);
    plot([step_infos{i}.RiseTime step_infos{i}.RiseTime], [0 1], [colors{i} '--'], 'LineWidth', 1);
    text(step_infos{i}.RiseTime, 1.05 + y_offset, sprintf('Rise Time: %.2fs', step_infos{i}.RiseTime), 'Color', colors{i}, 'FontSize', 9, 'HorizontalAlignment', 'right');
    
    settling_y = y_responses{i}(find(t_responses{i} >= step_infos{i}.SettlingTime, 1));
    plot(step_infos{i}.SettlingTime, settling_y, [colors{i} 's'], 'MarkerFaceColor', colors{i}, 'DisplayName', [controllers{i} ' Settling Time']);
    plot([step_infos{i}.SettlingTime step_infos{i}.SettlingTime], [0 settling_y], [colors{i} '--'], 'LineWidth', 1);
    text(step_infos{i}.SettlingTime, settling_y + 0.05 + y_offset, sprintf('Settling Time: %.2fs', step_infos{i}.SettlingTime), 'Color', colors{i}, 'FontSize', 9, 'HorizontalAlignment', 'left');
    
    if step_infos{i}.Overshoot > 0
        peak_time = step_infos{i}.PeakTime;
        peak_value = step_infos{i}.Peak;
        plot(peak_time, peak_value, [colors{i} '^'], 'MarkerFaceColor', colors{i}, 'DisplayName', [controllers{i} ' Overshoot']);
        plot([0 peak_time], [peak_value peak_value], [colors{i} '--'], 'LineWidth', 1);
        text(peak_time, peak_value + 0.05 + y_offset, sprintf('Overshoot: %.1f%%', step_infos{i}.Overshoot), 'Color', colors{i}, 'FontSize', 9, 'HorizontalAlignment', 'left');
    end
    
    steady_state = y_responses{i}(end);
    steady_error = abs(1 - steady_state);
    plot(t_responses{i}(end), steady_state, [colors{i} 'd'], 'MarkerFaceColor', colors{i}, 'DisplayName', [controllers{i} ' Steady-State Error']);
    plot([0 t_responses{i}(end)], [steady_state steady_state], [colors{i} '--'], 'LineWidth', 1);
    text(t_responses{i}(end), steady_state + 0.05 + y_offset, sprintf('Steady-State Error: %.2f', steady_error), 'Color', colors{i}, 'FontSize', 9, 'HorizontalAlignment', 'left');
end

legend('Location', 'Best');
hold off;

PerformanceMetrics = table({'P'; 'PI'; 'PID'}, ...
                           [step_infos{1}.RiseTime; step_infos{2}.RiseTime; step_infos{3}.RiseTime], ...
                           [step_infos{1}.Overshoot; step_infos{2}.Overshoot; step_infos{3}.Overshoot], ...
                           [step_infos{1}.SettlingTime; step_infos{2}.SettlingTime; step_infos{3}.SettlingTime], ...
                           [abs(1 - yP(end)); abs(1 - yPI(end)); abs(1 - yPID(end))], ...
                           'VariableNames', {'Controller', 'RiseTime(s)', 'Overshoot(%)', 'SettlingTime(s)', 'SteadyStateError'});

disp('Performance Metrics for P, PI, and PID Controllers:');
disp(PerformanceMetrics);
