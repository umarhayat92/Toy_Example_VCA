
% First load the data for the 3 circles (with random noise). Output contains 
% 3 matrices: a with points of radius 1, b with points of radius 2, and 
% matrix c with points of radius 3. The three-circle.mat file is available at github.com
load three-circle
A=[a;b;c];
[m,n] = size(A);

% Run vca for the data in circle of radius 1
[Va,Fa] = Test_vca(a);
% Obtain the following vanishing polynomials
% V[1]: -0.0029289 + -0.0018717*x1^1 + -0.0037363*x1^2 + -0.0085964*x2^1 + -0.0098679*x1^1*x2^1 + -0.0040014*x2^2
% V[2]: 0.0071771 + -0.018323*x1^1 + 0.014575*x1^2 + 0.0079099*x2^1 + 0.0018791*x1^1*x2^1 + -0.013195*x2^2
% V[3]: 0.057081 + 0.027306*x1^1 + -0.022669*x1^2 + 0.034134*x2^1 + 0.0078085*x1^1*x2^1 + -0.025418*x2^2
% V[4]: -0.0031898 + 0.0043479*x1^1 + -0.0088735*x1^2 + -0.0093791*x2^1 + -0.0098965*x1^1*x2^1 + -0.00018212*x2^2

% Run vca for the data in circle of radius 2
[Vb,Fb] = Test_vca(b);
% Obtain the following vanishing polynomials
% V[1]: -0.0085154 + 0.0045246*x1^1 + -0.001824*x1^2 + 0.0040495*x2^1 + -0.0047569*x1^1*x2^1 + -0.0018394*x2^2
% V[2]: -0.00074803 + -0.002677*x1^1 + -0.003201*x1^2 + 0.0036514*x2^1 + -0.00014712*x1^1*x2^1 + 0.0031667*x2^2
% V[3]: -0.021734 + 0.0003934*x1^1 + 0.0029035*x1^2 + -7.1611e-05*x2^1 + -0.0061985*x1^1*x2^1 + 0.003033*x2^2
% V[4]: 0.0064406 + -0.0053658*x1^1 + -0.0010205*x1^2 + -8.7092e-05*x2^1 + 0.0035605*x1^1*x2^1 + 0.003349*x2^2

% Run vca for the data in circle of radius 3
[Vc,Fc] = Test_vca(c);
% Obtain the following vanishing polynomials
% V[1]: -0.00081344 + -0.001873*x1^1 + -0.00080852*x1^2 + 4.0084e-05*x2^1 + -0.0020342*x1^1*x2^1 + -0.00075776*x2^2
% V[2]: -0.0012098 + -0.00041843*x1^1 + 0.0016503*x1^2 + 0.0025049*x2^1 + -0.00017593*x1^1*x2^1 + -0.0017986*x2^2
% V[3]: 0.0046382 + 0.0037462*x1^1 + -0.0012009*x1^2 + 0.0016973*x2^1 + 0.0020532*x1^1*x2^1 + -0.00095898*x2^2
% V[4]: 0.0033603 + 0.0016802*x1^1 + -0.0016802*x1^2 + -0.0033603*x2^1 + 0.00084009*x1^1*x2^1 + 0.0016802*x2^2


% Construction of the matrix T with the transformed features
m1 = abs(Polynomial_eval(Va{1},A));
m2 = abs(Polynomial_eval(Va{2},A));
m3 = abs(Polynomial_eval(Va{3},A));
m4 = abs(Polynomial_eval(Va{4},A));
m5 = abs(Polynomial_eval(Vb{1},A));
m6 = abs(Polynomial_eval(Vb{2},A));
m7 = abs(Polynomial_eval(Vb{3},A));
m8 = abs(Polynomial_eval(Vb{4},A));
m9 = abs(Polynomial_eval(Vc{1},A));
m10 = abs(Polynomial_eval(Vc{2},A));
m11 = abs(Polynomial_eval(Vc{3},A));
m12 = abs(Polynomial_eval(Vc{4},A));
T=[m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12];

% Plot of the 3 concentric circles (original data)
figure
hold on

scatter(a(:,1), a(:,2),'+r'); 
scatter(b(:,1), b(:,2),'ok'); 
scatter(c(:,1), c(:,2),'*b'); 
axis equal
hold off

% Plot of the projection onto the 3-dimensional space defined
% by the new features m1, m2 and m3

poly1 = 1;poly2 = 2;poly3 = 3;
figure
plot3(T(1:500,poly1),T(1:500,poly2),T(1:500,poly3),'+r')
hold on
plot3(T(501:1000,poly1),T(501:1000,poly2),T(501:1000,poly3),'ok')
hold on
plot3(T(1001:end,poly1),T(1001:end,poly2),T(1001:end,poly3),'*b')
hold off
