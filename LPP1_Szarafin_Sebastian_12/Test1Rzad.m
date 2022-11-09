function [] = Test1Rzad()
%% Sebastian Szarafin 313460
% Ten test bada rząd kwadratury z funkcji IntegralSimpRectMain
a=-1; b=1; c=-1; d=1; r=zeros(1,4);
correct=[4 0 4/3 0 4/5];
%% sprawdzenie rzędu dla kwadratury prostej
disp("RZĄD KW. PROSTEJ:");
N=1; M=1;
% rząd kw. względem zmiennej x (powinien być 4)
i=0; 
while abs(IntegralSimpRectMain(@(x,y)x.^i,a,b,c,d,N,M)-correct(i+1))<eps()
    i=i+1;
end
r(1)=i;
answer=['Rząd kw. względem zmiennej x: ', num2str(i)];
disp(answer);
% rząd kw. względem zmiennej y (powinien być 2)
i=0; 
while abs(IntegralSimpRectMain(@(x,y)y.^i,a,b,c,d,N,M)-correct(i+1))<eps()
    i=i+1;
end
r(2)=i;
answer=['Rząd kw. względem zmiennej y: ', num2str(i)];
disp(answer);
%% sprawdzenie czy złożenie kwadratury nie popsuje rzędu
disp("RZĄD KW. ZŁOŻONEJ:");
N=8; M=16;
% rząd kw. względem zmiennej x (powinien być 4)
i=0; 
while abs(IntegralSimpRectMain(@(x,y)x.^i,a,b,c,d,N,M)-correct(i+1))<eps()
    i=i+1;
end
r(3)=i;
answer=['Rząd kw. względem zmiennej x: ', num2str(i)];
disp(answer);
% rząd kw. względem zmiennej y (powinien być 2)
i=0; 
while abs(IntegralSimpRectMain(@(x,y)y.^i,a,b,c,d,N,M)-correct(i+1))<eps()
    i=i+1;
end
r(4)=i;
answer=['Rząd kw. względem zmiennej y: ', num2str(i)];
disp(answer);
%% sprawdzenie poprawności wyników
if r(1)==4 && r(2)==2 && r(3)==4 && r(4)==2
    disp("ZGADZA SIĘ!");
else 
    disp("NIE ZGADZA SIĘ!");
end
end

