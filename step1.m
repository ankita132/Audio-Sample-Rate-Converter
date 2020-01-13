% info = audioinfo('sample.mp3');
% [y, Fs] = audioread('sample.mp3');
% 
% audiowrite('NewFile.wav', y, Fs);

% sound(y, Fs);

[y, Fs] = audioread('NewFile.wav');

y1 = upsample(y, 160);

audiowrite('step1.wav', y1, Fs*160);
