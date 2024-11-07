function [weighted_signal] = MusicalWeightingC(f_c, sig)

% Define harmonic frequencies
f5 = f_c*2;
f6 = f5*2;
f3 = f_c/2;
f2 = f3/2;

fs = 8000;

fcenter = 440;

% Array of harmonic frequencies
ff_c = [f2, f3, f_c, f5, f6];

% Generate Gaussian weighting for these frequencies
output = exp( (-(log2(ff_c) - log2(fcenter)).^2) / (2*sig^2) );

% Define a time vector for constructing the signal (1 second duration)
t = 0:1/fs:2;

% Initialize the weighted signal
weighted_signal = zeros(size(t));

% Sum the weighted cosine terms for each frequency over time
for i = 1:length(ff_c)
    weighted_signal = weighted_signal + output(i) * cos(2*pi*ff_c(i)*t);
end

end