function [output, sampling_freq] = NoteHarmonics(base_freq)

% Harmonics
f6 = base_freq*2;
f7 = f6*2;
f8 = f7*2;
f9 = f8*2;
f4 = base_freq/2;
f3 = f4/2;
f2 = f3/2;
f1 = f2/2;

% Sampling Info
sampling_freq = f9 * 10;
Ts = 1/sampling_freq;

% function output
t = [0 : Ts : 2];
output = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t) + cos(2*pi*f4*t) + cos(2*pi*base_freq*t) + cos(2*pi*f6*t) + cos(2*pi*f7*t) + cos(2*pi*f8*t)  + cos(2*pi*f9*t);
