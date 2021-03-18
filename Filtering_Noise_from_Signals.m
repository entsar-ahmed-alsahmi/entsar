%% Filtering Noise from Signals
%% We will see now how to use fit and ifit to fllter out the noise from signals. First we add random noise 
%% to our signal and compute the amplitude spectrum.
close all; 
clear all;
clc;
dt = 1/100; % sampling ratea
et = 4; % end of the interval
t = 0:dt:et; % sampling range

y = 3*sin(4*2*pi*t)+ 5*sin(2*2*pi*t);
%With the Fourier Transform we can visualize what characterizes this signal the most.
%From the Fourier transform we compute the amplitude spectrum:
Y = fft(y); % compute Fourier transform
noise = randn(1,size(y,2)); % random noise
ey = y + noise; % samples with noise
eY = fft(ey); % Fourier transform of noisy signal
n = size(ey,2)/2; % use size for scaling
amp_spec = abs(eY)/n; % compute amplitude spectrum
%% To interpret these calculations we make a plot of the waveform and amplitude spectrum:
 figure % plots in new window
 subplot(2,1,1); % first of two plots
 plot(t,ey); grid on % plot noisy signal with grid
 axis([0 et -8 8]); % scale axes for viewing
xlabel('Time (s)'); % time expressed in seconds
ylabel('Amplitude'); % amplitude as function of time
subplot(2,1,2); % second of two plots
 freq = (0:79)/(2*n*dt); % abscissa viewing window
plot(freq,amp_spec(1:80)); grid on % plot amplitude spectrum
xlabel('Frequency (Hz)'); % 1 Herz = number of cycles per second
ylabel('Amplitude'); % amplitude as function of frequency
%% On the flrst plot we recognize the shape of the signal. In the plot of the amplitude spectrum,
%% the peaks and their heights are the same as on the plot of the amplitude spectrum of the original 
%% signal.  The wobbles we see around the peaks show that the amplitude of the noise is less than that
 %% of the original signal. We can visualize the output of the Fourier transforms:
 figure % new window for plot
plot(Y/n,'r+') % Fourier transform of original
 hold on % put more on same plot
plot(eY/n,'bx') % Fourier transform of noisy signal
%% Via the inverse Fourier transform, we fllter out the noise. The command flx rounds the elements of 
% its argument to the nearest integers towards zero. For this example, we use flx to set all elements in
 %% eY less than 100 to zero:
fY = fix(eY/100)*100; % set numbers < 100 to zero
ifY = ifft(fY); % inverse Fourier transform of fixed data
 cy = real(ifY); % remove imaginary parts
%%The vector cy contains the corrected samples. So, 
%%flnally we plot this corrected signal:
 figure % new window for plot
plot(t,cy); grid on % plot corrected signal
 axis([0 et -8 8]); % adjust scale for viewing
xlabel('Time (s)'); % time expressed in seconds
ylabel('Amplitude'); % amplitude as function of time
%%Here we flltered out noise of low amplitude. Note we can also remove noise of high frequency.
