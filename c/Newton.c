#include <stdio.h>
#include <math.h>

//求解x=2sin(x+pi/3)的最小正根

#define PI 3.141592653589793

double newton_fun(double x){
    return x - ( (x - 2 * sin( x + PI/3 )) / (1 - 2 * cos( x + PI/3 )) );
}

int main(){
    double x = 1.5;
    double x_pre;    
    int count = 0;

    do{
        x_pre = x;
        x = newton_fun(x);
        count++;
        printf("round%2d: x_next = %f, x = %f, x_next-x = %.10f\n",count,x,x_pre,x-x_pre);
    }while(fabs(x - x_pre) >= 1e-8);
    printf("precision reached, result = %.8f\n", x);
}