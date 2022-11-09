function [] = Test3_AB_calka()
%% Sebastian Szarafin 313460
% Test sprawdza rząd kwadrtury na której opiera się metoda 
% Adamsa-Bashfortha rzędu 4.
% Test wykazuje że jeżeli y' jest zależne jedynie od x tj. gdy równanie
% różniczkowe jest równowarzne zwykłej całce oznaczonej, to rząd 
% kwadratury jest równy 4 tzn. kwadratura jest dokładna dla wielomianów
% stopnia <= 3.

x0 = 0; xn = 1; N = 4; h = (xn-x0)/N; 

for i = 0:5
    f = @(x, y, d_y)x^i;
    y = @(x)1/(i+1)*x^(i+1);

    Y = zeros(2, N+1);
    Y = RungeKutta4(Y, h, 3, f);
    [Y(1,:), Y(2,:)] = AdamsBashforth4(Y, h, N, f);

    P = Y(2,length(Y))-Y(2,length(Y)-1); % (xn-h)_/(xn)
    Pd = y(1) - y(3/4);                  % (3/4)_/(1)
    
    disp(['Wielomiany stopnia ',  int2str(i), ': ', ...
        int2str(abs(Pd-P) < eps())]);

end

end

