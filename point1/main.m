%
% b)
%
syms s t;

% Matrix of the system
A = [-33.33 -7956 ; 0.1814 0];

% Initial vector
X0 = [823 ; 105];


% Parameters
X_MAX_RANGE = 2;
range = 0:X_MAX_RANGE;
I = eye(2);
dt = 0.01;
N_MAX_EXP_TERMS = 100;
rangexy = [0 5 -1000 1000];
t_axis = 0:dt:X_MAX_RANGE;
%
% Calculate  simbolically by L^-1[(s*I - A)^-1]*X0
%
O1 = simplify( ilaplace( inv(s * I - A) ) );
X1 = simplify( O1 * X0 );


subplot(2,2,1);
x11 = X1(1);
x12 = X1(2);
P1 = [];
P2 = [];

for i = t_axis 
    P1 = [P1, subs( x11, i)];
end

for i = t_axis
    P2 = [P2, subs( x12, i)];
end

plot(t_axis, P1, t_axis, P2);


%
% Calculate numericaly by exponential matrix e^A*t
%
Points = matrixExp(A, X0, dt, X_MAX_RANGE, N_MAX_EXP_TERMS );

subplot(2,2,2);
p1 = plot(t_axis, Points(1, 1:end)); hold on;
axis(rangexy);
p2 = plot(t_axis, Points(2, 1:end));
axis(rangexy);
set(p1, 'Color', 'blue');
set(p2, 'Color', 'red');


