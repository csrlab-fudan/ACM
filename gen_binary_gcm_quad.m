% to generate binary GCM quad of size within 78x78
% input: m is the length in the first dimension 
%        n is the length in the second dimension
% output: [q1, q2, q3, q4] is a binary GCM quad
% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
function [q1, q2, q3, q4] = gen_binary_gcm_quad(m, n)
assert(1<=m && m<=78 && 1<=n && n<=78, 'Out of range');
[m2, M] = expo_dec(m, 2);
[n2, N] = expo_dec(n, 2);
[a, b, c, d] = gen_golay_sequence_quad_inter(M);
[e, g, f, h] = gen_golay_sequence_quad_inter(N);
q1 = -kron(flip(b'), e) + kron(a.', flip(conj(f))) + kron(c.', g) + kron(d.', h);
q2 = kron(flip(a'), e) + kron(b.', flip(conj(f))) + kron(d.', flip(conj(g))) - kron(c.', flip(conj(h)));
q3 = -kron(flip(d'), e) - kron(c.', f) + kron(a.', flip(conj(g))) - kron(b.', h);
q4 = kron(flip(c'), e) - kron(d.', f) + kron(b.', g) + kron(a.', flip(conj(h)));
for i = 1:m2
    [q1, q2, q3, q4] = concate(q1, q2, q3, q4, 1);
end
for i = 1:n2
    [q1, q2, q3, q4] = concate(q1, q2, q3, q4, 2);
end
end

function [expo, num] = expo_dec(num, base)
expo = 0;
while mod(num, base) == 0
    num = num / base;
    expo = expo + 1;
end
end

function [p1, p2, p3, p4] = concate(q1, q2, q3, q4, dim)
 p1 = cat(dim, q1, q2);
 p2 = cat(dim, q1, -q2);
 p3 = cat(dim, q3, q4);
 p4 = cat(dim, q3, -q4);
end
