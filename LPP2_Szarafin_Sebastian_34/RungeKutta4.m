function Y = RungeKutta4(Y, h, N, f)
%% Sebastian Szarafin 313460
% RungeKutta4 - funkcja przybliżająca wartości w kolejnych punktach
%               rozwiązania układu różniczkowego, metodą Rungego-Kutty 
%               rzędu 4
% WEJŚCIE:  
%           Y   -   wektor wejściowy 
%                   (Y = [xk y(xk)] lub Y = [xk y(xk) y'(xk)]) 
%           h   -   długość kroku 
%           N   -   łączna liczba punktów do obliczenia
%           f   -   funkcja określająca równanie y' lub y''
%                   ( w zależności od wektora Y)
% WYJŚCIE:  
%           Y   -   wektor wyjściowy z obliczonymi N wartościami 

%% algorytm

for k = 1:N
    K0 = FY(Y(:,k), f);
    K1 = FY(Y(:,k)+1/2*h*K0, f);
    K2 = FY(Y(:,k)+1/2*h*K1, f);
    K3 = FY(Y(:,k)+h*K2, f);
    Y(:,k+1) = Y(:,k)+h*(K0+2*K1+2*K2+K3)/6;
end

end

