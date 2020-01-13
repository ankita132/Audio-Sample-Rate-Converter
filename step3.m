

[n,fo,ao,w] = firpmord([(44100/160)-(4100/160) (44100/160)],[1 0],[0.01, 0.1],44100);
b1 = firpm(n,fo,ao,w);

y_filtered = filtfilt(b1,1,y1);

audiowrite('step3.wav', y_filtered, Fs*160);