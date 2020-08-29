function cp = step3(data,cp_old,D_star)
    %Step 3
    cp_old = [0 cp_old length(data)];
    while 1
        N_old = length(cp_old(2:end-1));
        cp_tmp = cp_old(2:N_old+1);
        cp_new = [];
        for j = 1:N_old
            t1 = cp_old(j) + 1;
            t2 = cp_old(j+2);
            [M_value, loc] = max_D(data, t1, t2);
            if M_value > D_star
                cp_new = [cp_new loc];
            end
        end
        cp_new = unique(cp_new);
        N_new = length(cp_new);
        if N_old == N_new 
            n = 0;
            for i = 1:N_old
                if cp_new(i) == cp_tmp(i)
                    n = n + 1;
                end
            end
            if n == N_old
                break;
            end
        end
        cp_old = [0 cp_new length(data)];
    end
cp = cp_new;
end