function B = PR_Inv(A)
% Function that computes the inverse of matrix A using Gram-Schmidt factorization
% We perform the QR decomposition of matrix A using the Gram-Schmidt algorithm,
% for which each r(i,j) is q(i) transposed * a(j), and using an auxiliary matrix
% we find the elements on the diagonal of R. Q will contain elements equal to
% the division of the auxiliary matrix to the elements on the diagonal of R.
% If we need the inverse of A, we denote it with a row vector of column vectors.
% A*A^(-1) is the identity matrix. But by finding QR, we replace it in the equation.
% Q is orthonormal, and when multiplied by its transpose, it gives an identity matrix
% that does not change another matrix if multiplied by it. Then we have the equation
% R * A^(-1) = Q(T) * I. As we said, the inverse of a is written as column vectors.
% We still need to solve a triangular system, where R is an upper triangular matrix
% and is multiplied by each column of the inverse of A. The formula for each x is from
% lab 2. And we put all these columns in matrix B which is the output.

N = rows(A);
Q = zeros(N);
RR = zeros(N);
for j = 1 : N
for i = 1 : j - 1
RR(i, j) = Q(:, i)' * A(:, j);
endfor
v = zeros(N, 1);
for i = 1 : j-1
v = v + RR(i,j) * Q(:,i);
endfor
aux = A(:, j) - v;
RR(j, j) = norm(aux, 2);
Q(:, j) = aux/RR(j, j);
endfor
B = zeros(N);
I = eye(N);
for i = 1 : N
x = zeros(N, 1);
% b is each vector on each row that is a solution to each equation
b = Q' * I(:, i);
for j = N : -1 : 1
x(j) = b(j) / RR(j, j);
b(1 : j - 1) = b(1 : j - 1) - RR(1 : j - 1, j) * x(j);
endfor
B(:,i) = x;
endfor
endfunction