% to generate quaternary GCM quad of size 24x959
% input: 
% output: [q1, q2, q3, q4] is a quaternary GCM quad
% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
function [q1, q2, q3, q4] = quad_24x959
[a, b, c, d] = gen_golay_sequence_quad_inter(7);
a = a.';
b = b.';
c = c.';
d = d.';
[p11, p12] = gen_quaternary_gcm_pair(6, 5);
[p21, p22] = gen_quaternary_gcm_pair(6, 4*3*11);
e0 = [p11, p21];
f0 = [p11, -p21];
g0 = [p12, p22];
h0 = [p12, -p22];
e = [e0; zeros(size(e0)); zeros(size(e0)); f0];
g = [e0; zeros(size(e0)); zeros(size(e0)); -f0];
f = [zeros(size(e0)); g0; h0; zeros(size(e0))];
h = [zeros(size(e0)); g0; -h0; zeros(size(e0))];
q1 = -kron(flip_all(b'), e) + kron(a.', flip_all(conj(f))) + kron(c.', g) + kron(d.', h);
q2 = kron(flip_all(a'), e) + kron(b.', flip_all(conj(f))) + kron(d.', flip_all(conj(g))) - kron(c.', flip_all(conj(h)));
q3 = -kron(flip_all(d'), e) - kron(c.', f) + kron(a.', flip_all(conj(g))) - kron(b.', h);
q4 = kron(flip_all(c'), e) - kron(d.', f) + kron(b.', g) + kron(a.', flip_all(conj(h)));
figure;
stem3(abs(xcorr2(q1)+xcorr2(q2)+xcorr2(q3)+xcorr2(q4)));
end

function a = flip_all(a)
sa = size(a);
for i = 1:length(sa)
    a = flip(a, i);
end
end
