% to generate quaternary GCM quad of size 24x799
% input: 
% output: [Q1, Q2, Q3, Q4] is a quaternary GCM quad
% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
function [Q1, Q2, Q3, Q4] = quad_24x799
[a, b, c, d] = gen_golay_sequence_quad_inter(17);
[e, g, f, h] = gen_golay_sequence_quad_inter(47);
q1 = -kron(flip(b), e) + kron(a, flip(f)) + kron(c, g) + kron(d, h);
q2 = kron(flip(a), e) + kron(b, flip(f)) + kron(d, flip(g)) - kron(c, flip(h));
q3 = -kron(flip(d), e) - kron(c, f) + kron(a, flip(g)) - kron(b, h);
q4 = kron(flip(c), e) - kron(d, f) + kron(b, g) + kron(a, flip(h));
[p1, p2] = gen_quaternary_acm_pair(12, 1);
Q1 = [kron(q1, p1); kron(q2, p2)];
Q2 = [kron(q1, flip(p2)); -kron(q2, flip(p1))];
Q3 = [kron(q3, p1); kron(q4, p2)];
Q4 = [kron(q3, flip(p2)); -kron(q4, flip(p1))];
end
