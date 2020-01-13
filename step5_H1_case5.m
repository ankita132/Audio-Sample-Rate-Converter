% upsample by 4 followed by K(z)
% upsample by 4 followed by F(z)
% upsample by 10 followed by I(z)
% decimate by 21 followed by H(z)
% decimate by 7

rp = 10^(-0.1/20);
rs = 10^(-30/20);
wp = 20000;
ws = 22000;

wp = wp/4;
ws = ws/4;
[n1,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
K = remez(n1,fo,ao,w);

wp = wp/4;
ws = ws/4;
[n2,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
F = remez(n2,fo,ao,w);

wp = wp/10;
ws = ws/10;
[n3,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
I = remez(n3,fo,ao,w);

wp = wp*21;
ws = ws*21;
[n4,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
H = remez(n4,fo,ao,w);

mul = (n1+1)*44100*4/2 + (n2+1)*44100*4*4/2 + (n3+1)*44100*4*4*10/2 + (n4+1)*44100*4*4*10/(2*21);



