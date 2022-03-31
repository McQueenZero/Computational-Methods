% Matlab function for solution of matrix equation
% Using Jacobi method
% Initial solution set is considered as zero
% Author: Ajeet Kumar

% Take input as System Matrix A
% Coefficient Matrix B
% Value returns the solution set
function Value = jacobiMethod(A,B);
A = [9 -2 1;-1 8 -1;-1 1 8];
B = [6;8;-8]
% A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8]; % System Matrix
% A = [-4 1 1 0 0 0;...
%      1 -4 0 1 0 0;...
%      1 0 -4 1 1 0;...
%      0 1 1 -4 0 1;...
%      0 0 1 0 -4 1;...
%      0 0 0 1 1 -4];
% disp('The given system matrix A from system of equation is: ');
% disp(A);
% B = [6; 25; -11; 15];  % Constant Matrix
% B = [ -8;-8;-8;-8;-8;-8];
% disp('The constant matrix B is: ');
% disp(B);
% x = A\B;                % Solution using inverse method
[M,N] = size(A);        % Size of matrix
x = [1;0;0];         % Zero matrix initialization for solution
err = 1e-3;             % Initialise error limit

K = 50;                 % Number of iterations to be done
for k = 1:K   
    x2 = x;
    for m = 1:N
        
        x(m) = (B(m) - (A(m,1:m-1)*x2(1:m-1))-(A(m,m+1:N)*x2(m+1:N)))/(A(m,m));
    
    end
    disp([num2str(x')]);
    disp([num2str(norm(abs(x2-x),inf))])
    errorVal = abs(x2-x);           % Calculation of error
    if errorVal<=err
       break;
    end
end
Value = x;
disp(['The solution set is:                     ', num2str(x')]);   % Solution of System of equations 
disp(['Number of iteration taken for solution:  ', num2str(k)]); % Display number of iteration taken

end