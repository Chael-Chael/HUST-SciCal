clc, clear, close all
%bisection
a = 0.0;
b = 1.0;
eps = 1e-4;

result_bi = bisection_fun(a, b, eps);

function result = bisection_fun(a, b, eps)
    count = 0;
    while ( b - a > eps)
        c = 0.5 * (a + b);
        count = count + 1;
        result = fun(c);
        fprintf('round%2d: a = %f, b = %f, x = %f, f(x) = %f, precision = %f\n', count, a, b, c, fun(c), (b-a)/2.0);
        if (fun(a) * fun(c) < 0)
            b = c;
        else
            a = c;
        end
    end
end

function value = fun(x)
    value = ( x - power( 2, -x));
end