%% IN LAB 3.1
% userInp = input("Please enter a string: ", "s")
userInp = 'Arman Latefi';
reverse = userInp(length(userInp): - 1: 1)

%% IN LAB 3.2
% <include>myDecayingSinusoid.m</include>

%--- make a plot of sum of cosines
dt = 1/800;
XX = rand(1,3).*exp(2i*pi*rand(1,3)); %--Random amplitude and phases
freq = 20;
ccsum = zeros(1,500);
for kx = 1:length(XX)
    kt = [1:1:500];
    ccsum = ccsum + abs(XX(kx))*cos(2*pi*freq*kt*dt + angle(XX(kx)));
    tt = kt*dt;
end

plot(tt,ccsum) %-- Plot the sum sinusoid
grid on, zoom on, shg

%% Decaying Sinusoid
% Function in mySinusoid.m when b = 0.8
[tt, xs] = myDecayingSinusoid(10, 0.8, (40*2*pi), (pi/4), 80, 0, 2);
figure(1)
plot(tt, xs), grid on
title("Plot of Decaying Sinusoid (b=0.8)")
xlabel("Time (seconds)")

% Function in mySinusoid.m when b = 3
[tt, xs] = myDecayingSinusoid(10, 3, (40*2*pi), (pi/4), 80, 0, 2);
figure(2)
plot(tt, xs), grid on
title("Plot of Decaying Sinusoid (b=3)")
xlabel("Time (seconds)")

%% Reading WAV File
[xx, fs] = audioread("ece2026Lab01voice.wav");
% xx is the value at each sample given the audio wave
% fs is the sample rate

t_start = 0.25 * fs;
t_end = 0.5 * fs;
tt = 0.25: 1/fs : 0.5;
info = xx(t_start: 1 : t_end);
plot(tt, info), grid on
title("Slice of ece2026Lab01voice.wav")
xlabel("Time (seconds)")

% To find the period, I read the distance between two peaks on the graph 
period = 0.00775
% Given the period, I can find the frequency by doing 1 / period
frequency = 1 / period

% Plays the sound from xx and fs
soundsc(xx,fs)
%% Processing the Data and Writing the Result into a wav File

% Reversing the Decaying Sinusoid (b = 0.8)
[tt, xDecay] = myDecayingSinusoid(10, 0.8, (40*2*pi), (pi/4), 80, 0, 2);
Lx = length(xDecay);
xDecayReversed = xDecay(Lx:-1:1); % figure out how to fill in those ??s
figure(1)
plot(tt, xDecayReversed), grid on
title("Reverse of a Decaying Sinusoid (b = 0.8)")
xlabel("Time (seconds)")

% Reversing the Decaying Sinusoid (b = 3)
[tt, xDecay] = myDecayingSinusoid(10, 3, (40*2*pi), (pi/4), 80, 0, 2);
Lx = length(xDecay);
xDecayReversed = xDecay(Lx:-1:1); % figure out how to fill in those ??s
figure(2)
plot(tt, xDecayReversed), grid on
title("Reverse of a Decaying Sinusoid (b = 3)")
xlabel("Time (seconds)")

% Reversing the audio file

% Lxh = length(xh);
% xhReversed = xh(Lxh:-1:1); % figure out how to fill in those ??s
% audiowrite( 'ECE2026lab01outRev.wav' , xhReversed , fs );

%% "myDecayingSinusoid.m"
% <include>myDecayingSinusoid.m</include>