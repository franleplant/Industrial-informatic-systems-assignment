% b) --> hacer simbolico con laplace, hacer un for calculando la exponencial y hacer la simulacion con simulink
% c) hacer solo la simulacion


%
% b)
%


syms s t;

% Matrix of the system
A = [-0.0333 -7.9561 ; -0.1814 0];

% Initial vector
X0 = [823 ; 1000];


% Parameters
X_MAX_RANGE = 18;
range = 0:X_MAX_RANGE;
I = eye(2);
dt = 0.01;


%
% Calculate  simbolically by L^-1[(s*I - A)^-1]*X0
%
O1 = simplify( ilaplace( inv(s * I - A) ) );
X1 = simplify( O1 * X0 );


subplot(2,2,1);
p1 = ezplot(X1(1, 1), range); hold on;
p2 = ezplot(X1(2, 1), range);
set(p1, 'Color', 'blue');
set(p2, 'Color', 'red');


%
% Calculate numericaly by exponential matrix e^A*t
%
Points = matrixExp(A, X0, dt, X_MAX_RANGE, 20 )
t_axis = 0:dt:X_MAX_RANGE;

subplot(2,2,2);
p1 = plot(t_axis, Points(1, 1)); hold on;
p2 = plot(t_axis, Points(2, 1));
set(p1, 'Color', 'blue');
set(p2, 'Color', 'red');



%
% c)
%

if 0 
B = [2.193 0; 0 -0.05];
u = [250; 2000];

syms tau;

O1_tau = subs(O1, t, t - tau);

X1 = simplify( O1*X0 + int( O1_tau*B*u, tau, 0, t ) )


subplot(2,2,3);
p1 = ezplot(X1(1, 1), range); hold on;
p2 = ezplot(X1(2, 1), range);
set(p1, 'Color', 'blue');
set(p2, 'Color', 'red');



O2_tau = subs(O2, t, t - tau);

X2 = simplify( O2*X0 + int( O2_tau*B*u, tau, 0, t ) )


subplot(2,2,4);
p1 = ezplot(X2(1, 1), range); hold on;
p2 = ezplot(X2(2, 1), range);
set(p1, 'Color', 'blue');
set(p2, 'Color', 'red');



end



