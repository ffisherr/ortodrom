function [phi_res, lambda_res] = Curs(phi, lambda)
    
%test_len = fix(rand(1) * 10 / 2)+2;
%test_dots = zeros(test_len, 1);
%for i = 1 : test_len
%    test_dots(i) = fix(rand(1) * 100) - 1;
%end%)
test_dots = [3, 20, 30];

len = 100;
phi_res = phi;
lambda_res = lambda;
for i = 1 : len 
    if (sum(ismember(test_dots, i)) > 0)
        phi(i) = phi(i) - rand(1) / 2;
        t_phi = phi_res;
        t_l = lambda_res;
        [phi_res, lambda_res] = Ortodromical(deg2rad(lambda(i)), deg2rad(phi(i)), deg2rad(lambda(len-2)), deg2rad(phi(len-2)));
        phi_res = vertcat(t_phi(1:i-1),phi_res);
        lambda_res = vertcat(t_l(1:i-1), lambda_res);
        %[t_phi, t_lambda] = Ortodromical(lambda(i), phi(i), lambda(end), phi(end));
        %phi_res(i:end) = t_phi(1:len-i+1);
        %lambda_res(i:end) = t_lambda(1:len-i+1);
    end
end

end