#include <stdio.h>
#include <math.h>

double picard_fun(double x){
    return ( (cos(0.5) * x - sin(x) + 1.0) / (1.0 + cos(0.5)));
}

int main(){
    double x = 0.5;
    double x_pre;
    int count = 0;

    do{
        x_pre = x;
        x = picard_fun(x);
        count++;
        printf("round%2d: x_next = %f, x = %f, x_next-x = %.10f\n",count,x,x_pre,x-x_pre);
    }while(fabs(x - x_pre) >= 1e-8);
    printf("precision reached, result = %.8f\n", x);
}