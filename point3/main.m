Ts1 = 0.33 * 10^-3;

k = 20 * 1.28;


GPps = tf([k], [.000099 .0333 1 0]); 

% b)
% c2d matlab function already includes a ZOH
GPpz = c2d(GPps, Ts1);
