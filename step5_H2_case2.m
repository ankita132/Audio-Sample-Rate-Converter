% upsample by 2 followed by K(z)
% upsample by 8 followed by F(z)
% upsample by 5 followed by I(z)
% upsample by 2 followed by H(z)
% decimate by 7 followed by A(z)
% decimate by 21

rp = 10^(-0.01/20);
rs = 10^(-55/20);
wp = 20000;
ws = 22000;

wp = wp/2;
ws = ws/2;
[n1,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
K = remez(n1,fo,ao,w);

wp = wp/8;
ws = ws/8;
[n2,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
F = remez(n2,fo,ao,w);

wp = wp/5;
ws = ws/5;
[n3,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
I = remez(n3,fo,ao,w);

wp = wp/2;
ws = ws/2;
[n4,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
H = remez(n4,fo,ao,w);

wp = wp*7;
ws = ws*7;
[n5,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
A = remez(n5,fo,ao,w);

mul = (n1+1)*44100*2/2 + (n2+1)*44100*2*8/2 + (n3+1)*44100*2*8*2/2 + (n4+1)*44100*2*8*2*5/2 + (n5+1)*44100*2*8*2*5/(2*7);



