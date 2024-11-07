function [weighted_signal] = MusicalWeightingDiscrete(fc, sig)

% Define harmonic frequencies
f6 = fc*2;
f7 = f6*2;
f8 = f7*2;
f9 = f8*2;
f4 = fc/2;
f3 = f4/2;
f2 = f3/2;
f1 = f2/2;

fs = 22050;

% Array of harmonic frequencies
ff_discr = [f1, f2, f3, f4, fc, f6, f7, f8, f9];

% Generate Gaussian weighting for these frequencies
output = exp( (-(log2(ff_discr) - log2(500)).^2) / (2*sig^2) );

% Define a time vector for constructing the signal (1 second duration)
t = 0:1/fs:1;

% Initialize the weighted signal
weighted_signal = zeros(size(t));

% Sum the weighted cosine terms for each frequency over time
for i = 1:length(ff_discr)
    weighted_signal = weighted_signal + output(i) * cos(2*pi*ff_discr(i)*t);
end

end