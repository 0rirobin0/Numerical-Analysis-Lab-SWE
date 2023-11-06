x;
function y = my_function(x)
    y= x.^3-2*x.^2-4;
end
a = 1;
b = 3;
tolerance = 1e-6;
max_iterations = 100;

roots = [];
a = 1;
b = 3;
tolerance = 1e-6;
max_iterations = 100;

roots = [];

for i = 1:max_iterations
    c = (a * my_function(b) - b * my_function(a)) / (my_function(b) - my_function(a));
    roots = [roots; c];

    if abs(my_function(c)) < tolerance
        break;
    end

    if my_function(a) * my_function(c) < 0
        b = c;
    else
        a = c;
    end
end
disp(roots);
x = linspace(1, 3, 100);
y = my_function(x);

plot(x, y, 'k-');
hold on;
scatter(roots, my_function(roots), 'ro');
xlabel('x');
ylabel('f(x)');
title('False Position Method for Root Finding');
grid on;
legend('f(x)', 'Roots');

