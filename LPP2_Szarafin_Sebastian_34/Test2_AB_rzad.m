function [] = Test2_AB_rzad()
%% Sebastian Szarafin 313460
% Test rzędu metody Adamsa-Bashfortha rzędu 4 na podstawie 
% równania y' = y , y(0) = 1 => y(x) = exp(x).
% Test wykazuje że przy zmniejszeniu kroku 2 razy błąd globalny
% zmniejsza się ~16-krotnie

x0 = 0; xn = 5;
f = @(x, y, d_y)y;
y = @(x)exp(x);

p = 100;

%% N = p
N = p;
h = (xn-x0)/N;

Y1 = zeros(2, N+1);
Y1(:,1) = [0 1]';
Y1 = RungeKutta4(Y1, h, 3, f);
[Y1(1,:), Y1(2,:)] = AdamsBashforth4(Y1, h, N, f);
hP = Y1(2,2:length(Y1))-Y1(2,1:length(Y1)-1); 
d1 = sum(y(x0+h:h:xn)-y(x0:h:xn-h)-hP);     % y(tn)-y(tn-1)-hP

%% N = p*2
N = p*2;
h = (xn-x0)/N;

Y2 = zeros(2, N+1);
Y2(:,1) = [0 1]';
Y2 = RungeKutta4(Y2, h, 3, f);
[Y2(1,:), Y2(2,:)] = AdamsBashforth4(Y2, h, N, f);
hP = Y2(2,2:length(Y2))-Y2(2,1:length(Y2)-1); 
d2 = sum(y(x0+h:h:xn)-y(x0:h:xn-h)-hP);     % y(tn)-y(tn-1)-hP

%% d1/d2 ~ 16
disp(d1/d2);

end

