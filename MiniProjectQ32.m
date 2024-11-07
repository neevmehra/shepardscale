% Q3.2
% Gaussian weighting function & parameters
sig_c = 1;
fs_c = 8000;
fcenterc = 261.63;
weighted_c = MusicalWeightingC(fcenterc, sig_c); % Gaussian function
% Spectrogram parameters
window_c = hamming(2048);
noverlap_c = 1024;
nfft_c = 2048;
figure;
spectrogram(weighted_c, window_c, noverlap_c, nfft_c, fs_c, 'yaxis'); % Plotting spectrogram
ylim([0 1.2]);