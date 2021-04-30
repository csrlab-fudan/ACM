function [a, b, c, d] = gen_golay_sequence_quad_inter(M)
s = (M-1)/2;
[A, B, C, D] = gen_base_sequence(M);
a = interleave(A, zeros(1, s));
b = interleave(B, zeros(1, s));
c = interleave(zeros(1, s+1), C);
d = interleave(zeros(1, s+1), D);
% figure;
% stem(abs(xcorr(A)+xcorr(B)+xcorr([C, 0])+xcorr([D, 0])));
end

function [a, b, c, d] = gen_base_sequence(M)
if M==1
    a = 1; b = 1; c = []; d = [];
    return;
end
 
s = (M-1)/2;
try
    seq = gen_binary_golay_sequence_pair(s);
catch
    [a, b, c, d] = lookup_sequences(s);
    return;
end
a = [seq(1, :), 1];
b = [seq(1, :), -1];
c = seq(2, :);
d = c;
end

function [a, b, c, d] = lookup_sequences(s)
struc = load('baseSequence.mat');
bs = struc.bs;
str = ['bs.bs', num2str(s)];
try
    a = eval([str, '.a']);
    b = eval([str, '.b']);
    c = eval([str, '.c']);
    d = eval([str, '.d']);
catch
    error('Infeasible Size');
end
end

function c = interleave(a, b)
c = zeros(1, length(a)+length(b));
c(1:2:end) = a;
c(2:2:end) = b;
end