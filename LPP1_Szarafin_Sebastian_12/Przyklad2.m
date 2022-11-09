function [] = Przyklad2()
%% Sebastian Szarafin 313460
% Sprawdzenie wyniku przybliżenia całki funkcji f=sin(x)*y. 
% Wynik z Wolframa: ~216
format long
a=-3; b=3; c=-3; d=3; 
f=@(x,y)x.^2+y.^2;
correct=216;

x=a:0.1:b;
y=c:0.1:d;
figure(2);
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

