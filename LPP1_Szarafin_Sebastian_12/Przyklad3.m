function [] = Przyklad3()
%% Sebastian Szarafin 313460
% Sprawdzenie wyniku przybliżenia całki funkcji f=exp(x+y). 
% Wynik z Wolframa: ~22024.5
format long
a=-5; b=5; c=-5; d=5; 
f=@(x,y)exp(x+y);
correct=22024.5;

x=a:0.1:b;
y=c:0.1:d;
figure(1);
[X, Y]=meshgrid(x, y);
mesh(X, Y, f(X,Y));
xlabel("x");
ylabel("y");
zlabel("f(x,y)");

N=[1 10 100 1000 10000]; M=[1 10 100 1000 10000]; 
t=correct*ones(5,1); w=ones(5,1); e=ones(5,1); 
for i=1:5
    w(i)=IntegralSimpRectMain(f,a,b,c,d,N(i),M(i));
    e(i)=abs(w(i)-t(i));
end

T=table(N',M',w,t,e);
T.Properties.VariableNames={'N','M','uzyskany','teoretyczny','błąd'};
disp(T);

end

