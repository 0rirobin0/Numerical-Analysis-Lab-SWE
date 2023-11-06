x;
function y = my_function(x)
    y= x.^3-2*x.^2-4;
end
a = 1;
b = 3;
tolerance = 1e-6;
max_iterations = 100;

roots = [];

for i = 1:max_iterations
    c = (a + b) / 2;
    roots = [roots; c];

    if abs(b - a) < tolerance
        break;
    end

    if my_function(a) * my_function(c) < 0
        b = c;
    else
        a = c;
    end
end

%disp(roots);

x = linspace(1, 3, 100);
y = my_function(x);

plot(x, y, 'k-');  % Plot the equation in black
hold on;  % Hold the plot for overlay
scatter(roots, my_function(roots), 'ro');  % Plot roots as red circles
xlabel('x');
ylabel('f(x)');
title('Bisection Method for Root Finding');
grid on;
legend('f(x)', 'Roots');

