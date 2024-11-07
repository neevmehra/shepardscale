% Tune-Up #3

% Copy this file into a Matlab script window, add your code and answers to the
% questions as Matlab comments, hit "Publish", and upload the resulting PDF file
% to this page for the tune-up assignment.  Please do not submit a link to a file
% but instead upload the file itself.   Late penalty: 2 points per minute late.

% Shepard Scale Demo
% https://www.illusionsindex.org/i/shepard-scale-illusionsLinks to an external site. 

% Part A.  We will answer the question in Section 2 of mini-project #1 on
% Shepard Scale Synthesis.
% https://users.ece.utexas.edu/~bevans/courses/signals/homework/fall2024/miniproject1.pdfLinks to an external site. 

% Write a few lines of MATLAB code to make a plot of
% 10 exp( -(v-1)^2 / (2 (3)^2) over the range -10 <= v <= 10.
% This is g(v) where alpha = 10, mu = 1, and sigma=3.
% This question is in Section 2.2 of the lab assignment
% https://dspfirst.gatech.edu/chapters/DSP1st2eLabs/ShepardScaleLab.pdfLinks to an external site. 
fs = 8000;
Ts = 1/fs;
v = -10 : Ts : 10;

alpha = 10;
mu = 1;
sigma = 3;

g = alpha * exp( -(v - mu).^2 / (2 * (sigma^2)) );
figure;
plot(v, g);
ylim( [-1, alpha+1] );
title('Class Gaussian Plot');
xlabel('v');
ylabel('Gaussian g(v)');
grid on;
 

% Part B. We will answer the questions in Section 3.1 of mini-project #1 on
% Shepard Scale Synthesis.
% https://users.ece.utexas.edu/~bevans/courses/signals/homework/fall2024/miniproject1.pdfLinks to an external site.
ff_log = 2.^(log2(55): 1/12 : log2(1760));
ff_normal = 55: 2 : 1760;
fc = 440;
sig = 1; % width equal to one according to log scale (each octave is 2x prev)

% 3.1 part c
% Creating Frequency Weighting Objects
g_1 = FrequencyWeighting(fc, sig, ff_log);
g_2 = FrequencyWeighting(fc, sig, ff_normal);
g_3 = FrequencyWeighting(fc, sig, ff_normal);

figure;
semilogx(ff_log, g_1);
xlabel('Frequency (Hz)');
ylabel('Gaussian Weighting');
title('Gaussian centered at 440Hz w/ logarithmic inputs & semilogx');


% 3.1 part d, the Gaussian appears distorted because the plot command is
% on a linear basis regarding frequency. However, the Gaussian function
% utilizes a logarithmic scale and since the bell shape is compressed
% towards the center, distortion is created. 

%However, when you use semilogx, the x-axis becomes logarithmic which
%aligns with how the Gaussian function is defined. This creates the desired bell
%shape because the x-axis has proper frequency spacing by Gaussian
%distribution.

figure;
plot(ff_normal, g_2)
xlabel('Frequency (Hz)');
ylabel('Gaussian Weighting');
title('Gaussian centered at 440Hz w/ normal inputs & no semilogx');

figure;
semilogx(ff_normal, g_3);
xlabel('Frequency (Hz)');
ylabel('Gaussian Weighting');
title('Gaussian centered at 440Hz w/ normal inputs & semilogx');