
%{
STMATH 405 Assignment 1
%}
% Problem 1a


format long

f = @(x)(1 - cos(x.^2))./x.^4;




% 1c 


g = @(x) 1/2 - (x.^4 ./ 24);
x1 = linspace(-2, 2, 201); 
x1(x1==0) = eps;
subplot(2,2,1);
y = f(x1); 
y2 = g(x1);
plot(x1, y,'b', x1,y2, 'r'); % Plot the function
xlabel('x');
ylabel('f(x)');
   legend('(1 - cos(x^2))/x^4', '1/2 - (x^4/ 24)');

grid on;

subplot(2,2,2);
x2 = linspace(-1e-3, 1e-3,201);
x2(x2==0) = eps;
y1 = f(x2);
y3 = g(x2);
plot(x2,y1,'b',x2,y3,'r');
xlabel('x1');
ylabel('f(x1)');
legend('(1 - cos(x^2))/x^4', '1/2 - (x^4/ 24)')
grid on;

 
%{2a
%}

summation = 0;
for n = 1:100000
    summation = summation + 1 ./ (n).^4;
end
disp('The summation value is: ')
disp( summation);

absoluteError2 =  ((pi).^4)./90 - summation;
absoluteError2 = abs(absoluteError2);
disp('The absolute error is:');
disp( absoluteError2);


%2b

summationb = 0;
for n1 = 100000:-1:1
    summationb = summationb + 1 / (n1)^4;
end
disp('The reverse summation value is:')
disp(summationb);
absoluteError2b = ((pi).^4) ./ 90 - summationb;
absoluteError2b = abs(absoluteError2b);
disp('The absolute error for the reverse summation is:');
disp(absoluteError2b);


%{
Problem 3
%}

A = [1 10^6; 0 1];
[m,n] = size(A);


% Compute Frobenius norm
frobeniusNorm = norm(A, 'fro');

% Display the result
disp('Frobenius norm of the matrix using formula is: ')
disp(frobeniusNorm);

% Confused by what this matrix looks like in command
A_star = [1  10.^6; 10.^-6  1]; % this is A*
A2 = A - A_star;
frobeniusNormB= norm(A2,'fro');
disp('Frobenius norm of the matrix A2 is: ')
disp(frobeniusNormB);
% Relative change 
difference = frobeniusNormB ./ frobeniusNorm;
% Display the relative change
disp('Relative change in Frobenius norm:');
disp(difference);

% 3B

eigenA = eig(A);
eigenA1 = eig(A_star);

lambdaA(1) = eigenA(1);
lambdaA(2) = eigenA(2);
lambdaA1(1) = eigenA1(1);
lambdaA1(2) = eigenA1(2);

relative_change = sqrt(((lambdaA(1)- lambdaA1(1)).^2 + (lambdaA(2)-lambdaA1(2)).^2))/sqrt((lambdaA(1).^2)+(lambdaA(2).^2))


disp('The relative change for eigenvalues is ');
disp(relative_change)

%{
It is bigger by  1.000000000001000e+121
%}



% 3C
B = [1 2; 4 1]
B1 = [1 2; 4.001 1]

% Compute Frobenius norm
frobeniusNormBB = norm(B, 'fro');

% Display the result
disp('Frobenius norm of the matrix B using formula is: ')
disp(frobeniusNormBB);


B2 = B-B1;
frobeniusNormB2= norm(B2,'fro');
disp('Frobenius norm of the matrix B2 is: ')
disp(frobeniusNormB2);
% Relative change 
difference1 = frobeniusNormB2 ./ frobeniusNormBB;
% Display the relative change
disp('Relative change in Frobenius norm B:');
disp(difference1);

% 3B

eigenB = eig(B);
eigenB1 = eig(B1);

lambdaB(1) = eigenB(1);
lambdaB(2) = eigenB(2);
lambdaB1(1) = eigenB1(1);
lambdaB1(2) = eigenB1(2);

relative_changeB = sqrt(((lambdaB(1)- lambdaB1(1)).^2 + (lambdaB(2)-lambdaB1(2)).^2))/sqrt((lambdaB(1).^2)+(lambdaB(2).^2))


disp('The relative change for eigenvalues for B is ');
disp(relative_changeB)



%{
Problem 4c

%}

a = 1;
b =1;
y = zeros(30,1);
z = zeros(30,1);

area2 = 0;
for n =1:30
    c = 3.^(-n);
    area2 = ((3.^-n)./4).*sqrt(4-(3.^-(2*n)));
    s = 1/2 .*(a+b+c);
    area = sqrt(s.*(s-a).*(s-b).*(s-c));
    area1 = 1/4 .* sqrt((a + (b + c)).*(c - (a - b)).*(c +(a - b)).*(a + (b - c)));
    y(n) = (abs(area2-area))./area2; %relative error for herons formula
    z(n) = (abs(area2 - area1)) ./ area2; %relative error for reconstructed
end

disp('relative error table - y is with herons formula and z is the reconstructed formula')
T = table(y,z)
