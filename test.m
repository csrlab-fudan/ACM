% Last modified on April. 30, 2021
% Copyright Communication System Research Laboratory, Fudan University
%% quaternary ACM pair
[a, b] = gen_quaternary_acm_pair(26, 15); 
figure;
stem3(xcorr2(a)+xcorr2(b));

%% binary ACM quad of size within 78x78
for i = 1:78
    for j = 1:78
        [q1, q2, q3, q4] = gen_binary_acm_quad(i, j);
        corr = abs(xcorr2(q1)+xcorr2(q2)+xcorr2(q3)+xcorr2(q4));
        if sum(corr, 'all') - corr((end+1)/2, (end+1)/2) >= 1e-6 || corr((end+1)/2, (end+1)/2) ~= 4*i*j
            [i, j]
        end
    end
end

%% quaternary ACM quad of size 24 x n, n=1:1000
for i = 1:1000
    if i ~= 799 && i~=959
        [q1, q2, q3, q4] = gen_quaternary_acm_quad(24, i);
        corr = abs(xcorr2(q1)+xcorr2(q2)+xcorr2(q3)+xcorr2(q4));
        if sum(corr, 'all') - corr((end+1)/2, (end+1)/2) >= 1e-6 || corr((end+1)/2, (end+1)/2) ~= 4*24*i
            i
        end
    end
end
[q1, q2, q3, q4] = quad_24x799;
figure;
stem3(abs(xcorr2(q1)+xcorr2(q2)+xcorr2(q3)+xcorr2(q4)));
[q1, q2, q3, q4] = quad_24x959;
figure;
stem3(abs(xcorr2(q1)+xcorr2(q2)+xcorr2(q3)+xcorr2(q4)));