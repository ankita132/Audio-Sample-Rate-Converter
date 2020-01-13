% upsample by 5 followed by K(z)
% upsample by 32 followed by F(z)
% decimate by 7 followed by I(z)
% decimate by 7 followed by H(z)
% decimate by 3

rp = 10^(-0.1/20);
rs = 10^(-30/20);
wp = 20000;
ws = 22000;

wp = wp/5;
ws = ws/5;
[n1,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
K = remez(n1,fo,ao,w);

wp = wp/32;
ws = ws/32;
[n2,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
F = remez(n2,fo,ao,w);

wp = wp*7;
ws = ws*7;
[n3,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
I = remez(n3,fo,ao,w);

wp = wp*7;
ws = ws*7;
[n4,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
H = remez(n4,fo,ao,w);

mul = (n1+1)*44100*5/2 + (n2+1)*44100*5*32/2 + (n3+1)*44100*5*32/(2*7) + (n4+1)*44100*5*32/(2*7*7);



