clc,clear,close all

syms x

h = 1/6;
a = 1;
b = 2;

f = x / log(x+1);
x0_t = a:h:b;
y0_t = eval(subs(f, x, x0_t));
x0_s = a:h/2:b;
y0_s = eval(subs(f, x, x0_s));

I_t = trapezoid(x0_t, y0_t, h);
fprintf("trapezoid:%.10f\n",I_t);
I_s = simpson(x0_s, y0_s, h);
fprintf("simpson:%.10f\n",I_s);

%复合梯形公式
function I = trapezoid(x0, y0, h)
    I = h/2 * (y0(1) - y0(end) + 2 * sum(y0(2:end)));
end
%复合Simpson公式
function I = simpson(x0, y0, h)
    I = h/3 * ( (y0(1) - y0(end))/2 + 2 * sum(y0(2:2:end-1)) + sum(y0(3:2:end)));
end
