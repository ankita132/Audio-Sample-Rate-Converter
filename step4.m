y_final = downsample(y_filtered, 147);

audiowrite('step4.wav',y_final, 48000);