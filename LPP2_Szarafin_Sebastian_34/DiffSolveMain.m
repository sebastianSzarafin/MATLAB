function [x, y] = DiffSolveMain(order, a, b, c, d, x0, xn, n, y_x0, d_y_x0)
%% Sebastian Szarafin 313460
% DiffSolveMain - funkcja przybliżająca rozwiązanie liniowego układu 
%                 różniczkowego postaci a(x)y" + b(x)y' + c(x)y = d(x),
%                 z warunkami początkowymi, połączoną metodą 
%                 Rungego-Kutty i Adamsa-Bashfortha, na przedziale [x0, xn]
% WEJŚCIE:  
%           order   -   zmienna określająca rząd równania ze zbioru {1, 2} 
%           a       -   funkcja liniowa zmiennej x przemnażana przez y''
%                       po lewej stronie równania                        
%           b       -   funkcja liniowa zmiennej x przemnażana przez y'
%                       po lewej stronie równania
%           c       -   funkcja liniowa zmiennej x przemnażana przez y
%                       po lewej stronie równania
%           d       -   funkcja liniowa zmiennej x po prawej stronie
%                       równania
%           x0      -   punkt startowy, lewy kraniec przedziału
%           xn      -   punkt końcowy, prawy kraniec przedziału
%           n       -   liczba punktów pośrednich między x0 i xn 
%           y_x0    -   wartość funkcji y w punkcie x0
%           d_y_x0  -   wartość pochodnej funkcji y w punkcie x0 (jeśli
%                       równanie jest rzędu 1 ta zmienna nie jest 
%                       brana pod uwage)
% WYJŚCIE:  
%           x     -   wektor n wartości x na przedziale [x0, xn]
%           y     -   wektor wartości y(x)

%% algorytm
h = (xn-x0)/n;
Y = zeros(order+1, n+1);
if order == 1
    Y(:,1) = [x0 y_x0]; 
    f = @(x, y, d_y)(-c(x)*y+d(x))/b(x);
elseif order == 2
    Y(:,1) = [x0 y_x0 d_y_x0]; 
    f = @(x, y, d_y)(-b(x)*d_y-c(x)*y+d(x))/a(x);
end
% Metoda Rungego-Kutty, rząd 4
Y = RungeKutta4(Y, h, 3, f);
% Metoda Adamsa-Bashfortha, rząd 
[x, y] = AdamsBashforth4(Y, h, n+1, f);

figure(1)
plot(x, y, 'b', 'LineWidth', 2);
hold on
plot(x,zeros(size(x)), '--k');
xlim([min(x) max(x)]);
box on;
legend('y(x)');
hold off

end

%% Przykłady
% 1. 
%   Równanie(nie lin.): [x y] = DiffSolveMain(2,@(x)1, @(x)0, @(x)1, @(x)cos(2*x), 0, 10,1000,1, 0)
%   Wynik teoretyczny:  1 - (8*sin(x/2)^4)/3
% 2.
%   Równanie(nie lin.): [x y] = DiffSolveMain(1,@(x)0, @(x)1, @(x)4, @(x)exp(-x), 0, 10,1000,1)
%   Wynik teoretyczny:  exp(-x)/3 + (2*exp(-4*x))/3
% 3.
%   Równanie:           [x y] = DiffSolveMain(2,@(x)1, @(x)1, @(x)1, @(x)0, 0, 15,1000,1,2)
%   Wynik teoretyczny:  exp(-1/2*x)*(5/sqrt(3)*sin(sqrt(3)/2*x)+cos(sqrt(3)/2*x))
% 4. 
%   Równanie:           [x y] = DiffSolveMain(2,@(x)1, @(x)2, @(x)2, @(x)0, 0, 10,1000,1,1)
%   Wynik teoretyczny:  exp(-x)*(sin(x)+2*cos(x))
% 5. 
%   Równanie:           [x y] = DiffSolveMain(2,@(x)2, @(x)3, @(x)-5, @(x)0, 0, 2,1000,2,-1)
%   Wynik teoretyczny:  6/7*exp(-5/2*x)+8/7*exp(x)













