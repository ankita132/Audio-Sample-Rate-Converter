y2 = downsample(y1, 147);

Fs_new = Fs*160/147;

audiowrite('step2.wav', y1, Fs_new);