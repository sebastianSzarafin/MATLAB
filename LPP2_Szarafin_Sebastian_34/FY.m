function [out] = FY(Y, f)
%% Sebastian Szarafin 313460
% FY - funkcja pomocnicza zwracająca wektor składający się z pochodnych
%      składowych wektora Y w punkcie xk
% WEJŚCIE:  
%           Y   -   wektor wejściowy 
%                   (Y = [xk y(xk)] lub Y = [xk y(xk) y'(xk)]) 
%           f   -   funkcja określająca równanie y' lub y''
%                   ( w zależności od wektora Y)
% WYJŚCIE:  
%           out -   wektor wyjściowy
%                   (out = [1 f(xk)] lub out = [1 y'(xk) f(xk)])  

%% algorytm
switch length(Y)
    case 2
        out = [1 f(Y(1), Y(2), 0)]';
    case 3
        out = [1 Y(3) f(Y(1), Y(2), Y(3))]';
    otherwise
        error("Niepoprawny rozmiar Y!");
end

end

