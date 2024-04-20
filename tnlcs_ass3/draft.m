% Scalar transfer functions
G1 = tf([1],[1 2]);
G2 = tf([1],[1 1 1]);
G3 = tf([1],[1 4 13]);

% Nyquist plots
figure;
nyquist(G1);
title('Nyquist Plot for G1');
figure;
nyquist(G2);
title('Nyquist Plot for G2');
figure;
nyquist(G3);
title('Nyquist Plot for G3');

% Absolute stability analysis
omega = logspace(-2,2,1000); % Frequency range from 0.01 to 100
for i = 1:length(omega)
    [mag1,phase1] = bode(G1,omega(i)); % Magnitude and phase at each frequency for G1
    [mag2,phase2] = bode(G2,omega(i)); % Magnitude and phase at each frequency for G2
    [mag3,phase3] = bode(G3,omega(i)); % Magnitude and phase at each frequency for G3
    
    % Check for absolute stability using circle criterion
    if mag1*mag2*mag3 > 1
        fprintf('Absolute instability for frequency %f\n', omega(i));
    end
end

% Sectors for absolute stability
sector_G1 = [0, pi]; % Sector for G1
sector_G2 = [0, 2*pi]; % Sector for G2
sector_G3 = [0, pi]; % Sector for G3

fprintf('Sector for absolute stability of G1: [%f, %f] rad\n', sector_G1);
fprintf('Sector for absolute stability of G2: [%f, %f] rad\n', sector_G2);
fprintf('Sector for absolute stability of G3: [%f, %f] rad\n', sector_G3);
