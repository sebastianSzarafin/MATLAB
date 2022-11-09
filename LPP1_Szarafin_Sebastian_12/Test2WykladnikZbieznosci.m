function [] = Test2WykladnikZbieznosci()
%% Sebastian Szarafin 313460
% Ten test bada wykładnik zbieżności kwadratury z funkcji IntegralSimpRectMain
a=-1; b=1; c=-1; d=1;

%% sprawdzenie wykładnika zbieżności względem zmiennej x 
f=@(x,y)x.^4;
d4f=24;
correct=4/5;
war=1;
for N=1:1000
    H=(b-a)/N;
    E=1/180/16*H^4*(b-a)*d4f*3; % 3*błąd teoretyczny kw. Simpsona
    if abs(IntegralSimpRectMain(f,a,b,c,d,N,N)-correct)>E
        war=0;
        break;
    end
end
if war==1
    disp("WYKŁADNIK ZBIEŻNOŚCI WZGLĘDEM X ZGADZA SIĘ!")
else
    disp("WYKŁADNIK ZBIEŻNOŚCI WZGLĘDEM X NIE ZGADZA SIĘ!")
end
%% sprawdzenie wykładnika zbieżności względem zmiennej y 
f=@(x,y)y.^2;
d2f=2;
correct=4/3;
war=1;
for M=1:1000
    H=(d-c)/M;
    E=1/24*H^2*(d-c)*d2f*3; % 3*błąd teoretyczny kw. prostokątów 
    if abs(IntegralSimpRectMain(f,a,b,c,d,M,M)-correct)>E
        war=0;
        break;
    end
end
if war==1
    disp("WYKŁADNIK ZBIEŻNOŚCI WZGLĘDEM Y ZGADZA SIĘ!")
else
    disp("WYKŁADNIK ZBIEŻNOŚCI WZGLĘDEM Y NIE ZGADZA SIĘ!")
end
end

