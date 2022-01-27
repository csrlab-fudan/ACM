% to generate quaternary GCM quad of size s1t1 x (s2 +s3)t2 where s1 x s2, s1 x s3
% and t1 x t2 are feasible sizes of quaternary GCM pair
% input: m is the length in the first dimension 
%           n is the length in the second dimension
% output: [q1, q2, q3, q4] is a quaternary GCM quad
% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
function [q1, q2, q3, q4] = gen_quaternary_gcm_quad(m, n)
if m==0 || n==0
    q1 = []; q2 = []; q3 = []; q4 = [];
    return;
end

for i = 1:m
    if mod(m, i) ~= 0
        continue;
    end
    s1 = i;
    t1 = m/i;
    for j = 1:n
        if mod(n ,j) ~= 0
            continue;
        end
        t2 = n/j;
        for k = 1:j
            s2 = k; 
            s3 = j-k;
            try
                [a, b] = gen_quaternary_gcm_pair(s1, s2);
                [c, d] = gen_quaternary_gcm_pair(s1, s3);
                [e, f] = gen_quaternary_gcm_pair(t1, t2);
            catch
                continue;
            end
            A = [a, zeros(size(c))];
            B = [b, zeros(size(c))];
            C = [zeros(size(a)), c];
            D = [zeros(size(a)), d];
            q1 = kron(A, e) + kron(C, f);
            q2 = kron(A, conj(fliplr(flipud(f)))) - kron(C, conj(fliplr(flipud(e))));
            q3 = kron(B, e) + kron(D, f);
            q4 = kron(B, conj(fliplr(flipud(f)))) - kron(D, conj(fliplr(flipud(e))));
            return;
        end
    end
end
error('Infeasible size');
end
            
                
