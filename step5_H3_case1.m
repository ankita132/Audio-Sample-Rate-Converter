% upsample by 2 followed by K(z)
% upsample by 8 followed by F(z)
% upsample by 10 followed by I(z)
% decimate by 147

rp = 10^(-0.001/20);
rs = 10^(-80/20);
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

wp = wp/10;
ws = ws/10;
[n3,fo,ao,w] = remezord([wp ws], [1 0], [rp rs], 44100);
I = remez(n3,fo,ao,w);

mul = (n1+1)*44100*2/2 + (n2+1)*44100*2*8/2 + (n3+1)*44100*2*8*10/2;



