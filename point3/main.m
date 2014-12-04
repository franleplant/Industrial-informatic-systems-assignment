%
% a)
% different from k, important!
K = 0.116;
Gcs = K * tf([0.0165 1], [0.0165 0]);

%
% b)
%
Ts1 = 0.33 * 10^-3;
k = 20 * 1.28;

GPps = tf([k], [.000099 .0333 1 0]); 

% Gp(z): funcion de transferencia de la planta con Ts1 tiempo de sampleo
% c2d matlab function already includes a ZOH
GPpz = c2d(GPps, Ts1);



% Gc(z): funcion de transferencia en z del controlador
% Se calcula simplemente transformando Gc(s) al dominio z
Gdcz1= c2d( Gcs, Ts1, 'impulse');
subplot(2,1,1);
rlocus(Gdcz1);
% use sisotools(Gdcz);


%
% c)
%
Ts2 = 3.33 * 10^-3;

% Gp(z): funcion de transferencia de la planta con Ts2 tiempo de sampleo
% c2d matlab function already includes a ZOH
GPpz = c2d(GPps, Ts2);




% Gc(z): funcion de transferencia en z del controlador
% Se calcula simplemente transformando Gc(s) al domini
Gdcz2 = c2d( Gcs, Ts2, 'impulse');
subplot(2,1,2);
rlocus(Gdcz2);
