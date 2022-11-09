function [x, y] = AdamsBashforth4(Y, h, N, f)
%% Sebastian Szarafin 313460
% AdamsBashforth4 - funkcja przybliżająca wartości w kolejnych punktach
%                   rozwiązania układu różniczkowego, metodą 
%                   Adamsa-Bashfortha rzędu 4
% WEJŚCIE:  
%           Y   -   wektor wejściowy 
%                   (Y = [xk y(xk)] lub Y = [xk y(xk) y'(xk)]) 
%           h   -   długość kroku 
%           N   -   łączna liczba punktów do obliczenia
%           f   -   funkcja określająca równanie y' lub y''
%                   ( w zależności od wektora Y)
% WYJŚCIE:  
%           x     -   wektor N wartości x 
%           y     -   wektor wartości y(x) 

%% algorytm

alfa = [55 -59 37 -9];
for k = 4:N
    F_ki = [FY(Y(:,k), f) FY(Y(:,k-1), f) FY(Y(:,k-2), f) FY(Y(:,k-3), f)];
    Y(:,k+1) = Y(:,k)+h*sum(alfa.*F_ki,2)/24;
end
x = Y(1,:);
y = Y(2,:);

end

