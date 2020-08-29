function [M_value, loc] = max_D(a, init, fin)
% Step 1
    a_new = a(init:fin);
    a_new2 = a_new.^2;
    C = cumsum(a_new2);
    l = fin - init + 1;
    for i = 1:l
        % データの中心化と標準化
        D(i) = C(i)/C(l) - i/l;
    end
    [M_value, k_star] = max(sqrt(l/2).*abs(D));
    loc = init + k_star - 1;  
end
