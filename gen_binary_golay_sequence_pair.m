% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
function seq = gen_binary_golay_sequence_pair(s)
expo = len_dec(s);
e2 = [1, 1; 1, -1];
e10 =[1 -1 -1 1 -1 1 -1 -1 -1 1;
    1 -1 -1 -1 -1 -1 -1 1 1 -1];
e26 = [-1,1,-1,-1,1,1,-1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,1,1,-1,-1,-1,1,-1,1;
    -1,1,-1,-1,1,1,-1,1,1,1,1,-1,1,-1,1,1,1,1,-1,-1,1,1,1,-1,1,-1];
elements = {e26, e10, e2};
a = 1; b= 1;
for i = 1:3
    while expo(i) >0
        c = elements{i}(1, :);
        d = elements{i}(2, :);
        e = kron(a, (c+d)/2) + kron(b, (c-d)/2);
        f = kron(-flip(b), (c+d)/2) + kron(flip(a), (c-d)/2);
        a = e;
        b = f;
        expo(i) = expo(i)-1;
    end
end
seq = [a; b];
end
function expo = len_dec(num)
init = num;
base = [26, 10, 2];
expo = zeros(1, 3);
for i = 1:length(base)
    [expo(i), num] = expo_dec(num, base(i));
end
if num ~= 1
    error(sprintf('%d is undecomposable', init));
end
end

function [expo, num] = expo_dec(num, base)
expo = 0;
while mod(num, base) == 0
    num = num / base;
    expo = expo + 1;
end
end

    