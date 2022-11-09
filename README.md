# MATLAB

This repository holds 2 projects for *Numerical Methods 2021* course of Computer Science course.  

## LPP1_Szarafin_Sebastian_12

  The main function (IntegralSimpRectMain.m) calculates a value of an integral $\iint\limits_D f(x,y)\,dx\,dy$, where $D = [a,b] \times [c,d]$ using complex Simpson's quadrature for $x$ variable and complex rectangle quadrature (with mid point) for $y$ variable.
  Rest of files contains examples (Przyklad1.m, ... , Przyklad4.m) and tests (Test1Rzad.m, Test2WykladnikZbieznosci.m).
  

## LPP2_Szarafin_Sebastian_34

  The main function (DiffSolveMain.m) approximates the solution of a linear differential equation system $a(x)y'' + b(x)y' +c(x)y = d(x)$, with initial conditions, using combination of the Runge-Kutta (RungeKutta4.m) and Adams-Bashforth (AdamsBashforth4.m) methods, on the interval $[x_0, x_n]$.
  Rest of files contains tests.
