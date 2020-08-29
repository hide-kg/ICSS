function cp = ICSS(data, D_star)
    t1 = 1;
    T = length(data);
    cp = [];
    cp = step1_2a_2b(data, t1, T, D_star, cp);
    cp = step3(data, cp, D_star);
end
