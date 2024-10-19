# include <stdio.h>
# include <math.h>

double f(double x){
    return (x - pow(2, -x));
}

int main(){
    double a = 0, b = 1, c, eps = 1e-4;
    int count = 0;
    while (b - a > eps){
        c = 0.5 * (a + b);
        count++;
        printf("round%2d: a = %f, b = %f, x = %f, f(x) = %f, precision = %f\n", count, a, b, c, f(c), (b-a)/2.0);
        if (f(a) * f(c) < 0){
            b = c;
        } else {
            a = c;
        }
    }
    return 0;
}