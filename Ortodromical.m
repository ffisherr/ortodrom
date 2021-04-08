function [phi_res, lambda_res] = Ortodromical(long0, lat0, long1, lat1)

lambda1 = long0;
lambda2 = long1;
phi1 = lat0;
phi2 = lat1;
delta = rad2deg(acos(sin(phi1)*sin(phi2) + cos(phi1) * cos(phi2) * cos(lambda2-lambda1)));
l = 111.1; % длина дуги 1 градуса меридиана
D = l * delta;
fprintf("Угловая длина ортодромии %f градусов\n" + ...
    "Длина ортодромии %f км\n", delta, D);
len = 100;
dLambda = abs(lambda2-lambda1) / len;
disp(len);
x = zeros(len, 1);
y = zeros(len, 1);
lambda = lambda1;
phi = phi1;
i = 1;
while abs(lambda-lambda2) > 0.1 && abs(phi - phi1) > 0.1 || i < 100 
    phi = rad2deg(acot((tan(phi1) * sin(lambda2-lambda) / sin(lambda2-lambda1) + ...
        tan(phi2) * sin(lambda - lambda1) / sin(lambda2-lambda1))));
    x(i) = rad2deg(lambda);
    y(i) = phi;
    fprintf("%f %f\n", phi, rad2deg(lambda));
    lambda = lambda + dLambda;
    i = i + 1;
end
phi_res = y+20;
lambda_res = x;
end