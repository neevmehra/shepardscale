% Q4a - Synthesize a C major scale

% Note frequencies derived from https://www.intmath.com/trigonometric-graphs/music.php
[C261_63, fs261_63] = NoteHarmonics(261.63);
[D293_66, fs293_66] = NoteHarmonics(293.66);
[E329_63, fs329_63] = NoteHarmonics(329.63);
[F349_23, fs349_23] = NoteHarmonics(349.23);
[G392, fs392] = NoteHarmonics(392);
[A440, fs440] = NoteHarmonics(440);
[B493_88, fs493_88] = NoteHarmonics(493.88);
[C523_25, fs523_25] = NoteHarmonics(523.25);

% Q4b - Play the C-Major scale five times
for i = 1:5
sound(C261_63, fs261_63);
pause(3);
sound(D293_66, fs293_66);
pause(3);
sound(E329_63, fs329_63);
pause(3);
sound(F349_23, fs349_23);
pause(3);
sound(G392, fs392);
pause(3);
sound(A440, fs440);
pause(3);
sound(B493_88, fs493_88);
pause(3);
sound(C523_25, fs523_25);
pause(3);
end

sigma = 2;

% Q4c - Introduce amplitude weighting using a Gaussian form

[GC261_63, logf261_63] = MusicalWeighting(261.63, sigma); % Gaussian notes so log2
[GD293_66, logf293_66] = MusicalWeighting(293.6, sigma);
[GE329_63, logf329_63] = MusicalWeighting(329.63, sigma);
[GF349_23, logf349_23] = MusicalWeighting(349.23, sigma);
[GG392, logf392] = MusicalWeighting(392, sigma);
[GA440, logf440] = MusicalWeighting(440, sigma);
[GB493_88, logf493_88] = MusicalWeighting(493.88, sigma);
[GC523_25, logf523_25] = MusicalWeighting(523.25, sigma);

figure;
plot(logf261_63, GC261_63);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf293_66, GD293_66);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf329_63, GE329_63);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf349_23, GF349_23);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf392, GG392);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf440, GA440);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf493_88, GB493_88);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

figure;
plot(logf523_25, GC523_25);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Gaussian Note Frequency vs. Time');

% Q4d - Produce the illusion by using the Gaussian weight function

sig = 0.75;
Fs1 = 22050;   

[DC261_63] = MusicalWeightingDiscrete(261.63, sig);
[DDf271_18] = MusicalWeightingDiscrete(271.18, sig);
[DD293_66] = MusicalWeightingDiscrete(293.66, sig);
[DEf311_13] = MusicalWeightingDiscrete(311.13, sig);
[DE329_63] = MusicalWeightingDiscrete(329.63, sig);
[DF349_23] = MusicalWeightingDiscrete(349.23, sig);
[DGf369_99]     = MusicalWeightingDiscrete(369.99, sig);
[DG392]     = MusicalWeightingDiscrete(392, sig);
[DAb415_30]     = MusicalWeightingDiscrete(415.30, sig);
[DA440]     = MusicalWeightingDiscrete(440, sig);
[DBb466_16]  = MusicalWeightingDiscrete(466.16, sig);
[DB493_88]  = MusicalWeightingDiscrete(493.88, sig);


silVector = zeros(1, round(Fs1 * 0.4));

audiovector = [DC261_63, silVector, DD293_66, silVector, DE329_63, silVector, DF349_23, silVector, DG392, silVector, DA440, silVector, DB493_88, silVector];

repeatedAudio = repmat(audiovector, 1, 3);
soundsc(repeatedAudio, Fs1);

% Q4e - Make a spectrogram of playing the scale three times, there is a
% clear illusion when observing the spectrogram. You can see that the
% frequencies increase as the scale progresses, and that there is an
% overlap between the higher pitched notes vs. the lower ones, this overlap
% is producing the effect because the listener perceives the overlap as a
% continuous sound climbing the frequency ladder.

window = hamming(1024);
noverlap = 512;
nfft = 1024;
spectrogram(repeatedAudio, window, noverlap, nfft, Fs1, 'yaxis');

% Q4f - Variations: Play every note within the octave, the illusion does sound
% better because it has more frequencies in between, reducing the step
% makes the illusion more convincing because it's not as much as an
% auditory jump so the listener perceives the differences as marginal.

audiovector1 = [DC261_63, silVector, DDf271_18, silVector, DD293_66, silVector, DEf311_13, silVector, DE329_63, silVector, DF349_23, silVector, DGf369_99, silVector, DG392, silVector, DAb415_30, silVector, DA440, silVector, DBb466_16, silVector, DB493_88, silVector];

repeatedAudio1 = repmat(audiovector1, 1, 3);
soundsc(repeatedAudio1, Fs1);
spectrogram(repeatedAudio1, window, noverlap, nfft, Fs1, 'yaxis');

filename = 'mywav.wav';
normrepeatedaudio1 = repeatedAudio1 / (max(abs(repeatedAudio1)));

audiowrite(filename, normrepeatedaudio1, Fs1);