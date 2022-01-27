# Usage
## Quaternary GCM pair
  [a, b] = gen_quaternary_gcm_pair(m, n);  
  - Input: m is the length in the first dimension, n is the length in the second dimension.  
  - Output: [a, b] is a quaternary GCM pair.  

## Binary GCM quad of size within 78 x 78
  [q1, q2, q3, q4] = gen_binary_gcm_quad(m, n);  
  - Input: m is the length in the first dimension, n is the length in the second dimension.  
  - Output: [q1, q2, q3, q4] is a binary GCM quad.  

## Quaternary GCM quad of size s1t1 ×(s2 +s3)t2 where s1 ×s2, s1 ×s3 and t1 × t2 are the sizes of quaternary GCM pairs
  [q1, q2, q3, q4] = gen_quaternary_gcm_quad(m, n);  
  - Input: m is the length in the first dimension, n is the length in the second dimension.  
  - Output: [q1, q2, q3, q4] is a quaternary GCM quad.  
## Quaternary GCM quad of size 24 x 799
[q1, q2, q3, q4] = quad_24x799;  
- Output: [q1, q2, q3, q4] is a quaternary GCM quad of size 24 x 799. 

## Quaternary GCM quad of size 24 x 959
[q1, q2, q3, q4] = quad_24x959;  
- Output: [q1, q2, q3, q4] is a quaternary GCM quad of size 24 x 959. 

## test
### 1. To generate a quaternary GCM pair of size 26 x 15

### 2. To generate binary GCM quad of size within 78 x 78

### 3. To generate quaternary GCM quad of size 24 x (1:1000)
