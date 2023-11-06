
A = input('Enter matrix A:');

B = input('Enter matrix B:');

% Check if the matrices are compatible for multiplication
if size(A, 2) == size(B, 1)
    % Matrix A and B can be multiplied
    C = A * B;
    fprintf('Matrix A * B:\n');
    disp(C);
else
    fprintf('Matrix multiplication is not possible because the number of columns in A (%d) is not equal to the number of rows in B (%d).\n', size(A, 2), size(B, 1));
end

% Find and print the maximum value in matrix A
max_value_A = max(max(A));
fprintf('Maximum value in matrix A: %f\n', max_value_A);

