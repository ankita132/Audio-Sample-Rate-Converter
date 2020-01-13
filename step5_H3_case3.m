% upsample by 16 followed by K(z)
% upsample by 10 followed by F(z)
% decimate by 49 followed by A(z)
% decimate by 3

rp = 10^(-0.001/20);
rs = 10^(-80/20);
wp = 20000;
ws = 22000;

wp = wp/16;
ws = ws/16;
[n1,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
K = remez(n1,fo,ao,w);

wp = wp/10;
ws = ws/10;
[n2,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
F = remez(n2,fo,ao,w);

wp = wp*49;
ws = ws*49;
[n3,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
I = remez(n3,fo,ao,w);

mul = (n1+1)*44100*16/2 + (n2+1)*44100*16*10/2 + (n3+1)*44100*16*10/(2*49);



