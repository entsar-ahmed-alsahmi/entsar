% Filtering Noise from Signals
% We will see now how to use fit and ifit to fllter out the noise from signals. First we add our signal and compute the amplitude spectrum.

%dt = 1/Fs; % sampling rate
et = .5; % end of the interval
%t = (0:dt:et)'; % sampling range

%y = getaudiodata(myVoice);

%audiowrite('noisespeak.wav', y, 8000);
[y,Fs] = audioread('100hz.wav');
dt = 1/Fs;
%N=length(y);
time=(1:length(y))/Fs;
%%%%%exp%%%%%
%noise = randn(1,size(y,2)); % random noise
%eY = y + noise; % samples with noise
%ey = fft(eY); % Fourier transform of noisy signal
ey = fft(y);
figure
plot(time, y);grid on
axis([0 et -2 2]);
%With the Fourier Transform we can visualize what characterizes this signal the most.
%From the Fourier transform we compute the amplitude spectrum:
 % compute Fourier transform
n = size(y,1); % use size for scaling
time=(1:n)/Fs;
amp_spec = abs(ey)/n; % compute amplitude spectrum
%eyf0= filter(bandstop,ey);
%eyf= filter(stop2000,ey);

%% To interpret these calculations we make a plot of the waveform and amplitude spectrum:
 figure % plots in new window
 subplot(2,1,1); % first of two plots
 plot(time, y); grid on % plot noisy signal with grid
 axis([0 et -2 2]); % scale axes for viewing
xlabel('Time (s)'); % time expressed in seconds
ylabel('Amplitude'); % amplitude as function of time
subplot(2,1,2); % second of two plots
freq = (0:199)/(n*dt); % abscissa viewing window
plot(freq,amp_spec(1:200)); grid on % plot amplitude spectrum
xticks('auto');
xlabel('Frequency (Hz)'); % 1 Herz = number of cycles per second
ylabel('Amplitude'); % amplitude as function of frequency
%% On the flrst plot we recognize the shape of the signal. In the plot of the amplitude spectrum,
%% the peaks and their heights are the same as on the plot of the amplitude spectrum of the original 
%% signal.  The wobbles we see around the peaks show that the amplitude of the noise is less than that
 %% of the original signal. We can visualize the output of the Fourier transforms:
 figure % new window for plott
plot(ey/n,'bx') % Fourier transform of  signal
%% Via the inverse Fourier transform, we fllter out the noise. The command flx rounds the elements of 
% its argument to the nearest integers towards zero. For this example, we use flx to set all elements in
 %% eY less than 100 to zero:
fY = fix(ey/100)*100; % set numbers < 100 to zero
ifY = ifft(ey); % inverse Fourier transform of fixed data
 cy = real(ifY); % remove imaginary parts
%%The vector cy contains the corrected samples. So, 
%%flnally we plot this corrected signal:
 figure % new window for plot
plot(time,cy); grid on % plot corrected signal
 axis([0 5 -2 2]); % adjust scale for viewing
xlabel('Time (s)final'); % time expressed in seconds
ylabel('Amplitudefinal'); % amplitude as function of time
%%Here we flltered out noise of low amplitude. Note we can also remove noise of high frequency.

