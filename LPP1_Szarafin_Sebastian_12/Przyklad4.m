function [] = Przyklad4()
%% Sebastian Szarafin 313460
% Sprawdzenie wyniku przybliżenia całki funkcji f=sin(10*(x.^2+y.^2))/10. 
% Wynik z Wolframa: ~0.0334095
format long
a=-1; b=1; c=-1; d=1; 
f=@(x,y)sin(10*(x.^2+y.^2))/10;
correct=0.0334095;

x=a:0.01:b;
y=c:0.01:d;
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

