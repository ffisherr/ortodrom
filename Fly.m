function x = Fly(phi)

test_len = fix(rand(1) * 10 / 2)+2;
test_dots = zeros(test_len, 1);
for i = 1 : test_len
    test_dots(i) = fix(rand(1) * 100) - 1;
end

len = 100;
x = zeros(len, 1);
step_len = 0;
for i = 1 : len 
    if (sum(ismember(test_dots, i)) > 0) || step_len > 0
        if step_len == 0
            step_len = fix(rand(1) * 10 / 2);
        end
        step_len = step_len - 1;
        if rand(1) > 0.5
            x(i) = phi(i) - rand(1) / 2;
        else
            x(i) = phi(i) + rand(1) / 2;
        end
    else
        x(i) = phi(i);
    end
end

end