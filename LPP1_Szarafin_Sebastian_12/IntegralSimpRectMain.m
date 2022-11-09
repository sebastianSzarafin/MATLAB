function [out] = IntegralSimpRectMain(f, a, b, c, d, N, M)
%% Sebastian Szarafin 313460
% IntegralSimpRectMain - funkcja obliczająca wartość całki funkcji 2 
%               zmiennych (x,y) na prostokącie [a,b]x[c,d] za pomocą 
%               złożonej kwadratury Simpsona ze względu 
%               na zmienną x  oraz złożonej kwadratury prostokątów 
%               ze względu na zmienną y
% wejście:  f    -   funkcja której całkę obliczymy
%           a    -   lewy kraniec przedziału zmiennej x
%           b    -   prawy kraniec przedziału zmiennej x
%           c    -   lewy kraniec przedziału zmiennej y
%           d    -   prawy kraniec przedziału zmiennej y
%           N    -   liczba podprzedziałów zmiennej x 
%           M    -   liczba podprzedziałów zmiennej y 
% wyjście:  out  -   przybliżona wartość całki
%% algorytm 
% długości podprzedziałów [a,b] i [c,d]
H1=(b-a)/N; % długość podp. [a,b]
H2=(d-c)/M; % długość podp. [c,d]
% obliczenie macierzy współczynników kwadratury
A=[1 repmat([4 2],1,N-1) 4 1]; % wsp. kw. Simpsona, A=[1 4 2 4 ... 4 1]
% obliczenie węzłów kwadratury Simpsona
i=(1:2*N+1);
xi=ones(1,2*N+1)*a+H1*(i-1)/2; % xi=[a a+H1/2 a*H1 a*3/2*H1 ... b]
% obliczenie węzłów kwadratury prostokątów
j=(1:M);
yj=ones(1,M)*c+H2*(2*j-1)/2; % yj=[c+H2/2 c+3/2*H2 ... c+(2*M-1)/2*H2]
% macierz wartości f w węzłach 
W=f(xi',yj);
if size(W)==1       % przypadek gdy f jest stała
    out=A*W*M;
elseif isrow(W)     % przypadek gdy f jest zależna tylko od y
    out=W'*A;
elseif iscolumn(W)  % przypadek gdy f jest zależna tylko od x
    out=A'.*W*M;
else                % przypadek gdy f jest zależna od x i y 
    out=A*W;
end 
out=H1*H2/6*sum(out(:));
end
%% przykłady:
% x.^2+y.^2
% x+y
% 4
% exp(x*y)
% exp(x+y)
% sin(x)*y
% sin(x*y)
% |x|-|y|
% 5-|y|
% sin(10*(x.^2+y.^2))/10
% sin(5*x)*cos(5*y)/5
% (x.^2+y.^2).^0.5



