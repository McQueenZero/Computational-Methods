%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code finds the solution to a system of simultaneous linear equation
% using Gauss_Seidel Method.
% Written By: Mohammad Y. Saadeh, on 06/14/2010, University of Nevada Las
% Vegas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%A%%%%%%%%%%%%%%%%%%%%%%%%%

clear;clc
format compact
%%  Read or Input any square Matrix
A = [9 -2 1 ;
     -1 8 -1 ;
     -1 1 8 ];% coefficients matrix
C = [6;8;-8];% constants vector
n = length(C);
X = zeros(n,1);
Error_eval = ones(n,1);

%% Check if the matrix A is diagonally dominant
for i = 1:n
    j = 1:n;
    j(i) = [];
    B = abs(A(i,j));
    Check(i) = abs(A(i,i)) - sum(B); % Is the diagonal value greater than the remaining row values combined?
    if Check(i) < 0
        fprintf('The matrix is not strictly diagonally dominant at row %2i\n\n',i)
    end
end

%% Start the Iterative method

iteration = 0;
while max(Error_eval) > 0.001
    iteration = iteration + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:n
        j = 1:n; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (C(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xsolution(:,iteration) = X;
    Xerror(:,iteration) = norm(abs(X-Z),inf)
    Error_eval = sqrt((X - Z).^2);
end

%% Display Results
GaussSeidelTable = [1:iteration;Xsolution;Xerror]'
MaTrIx = [A X C]

