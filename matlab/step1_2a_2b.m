function [cp] = step1_2a_2b(data, t1, T, D_star, cp)
    %Step 1
    [M_value, loc] = max_D(data, t1, T);
    tmp_loc= loc;
    if M_value > D_star
        %Step 2a
        while 1
            t2 = loc;
            [M_value, loc] = max_D(data, t1, t2);
            if M_value < D_star
                break;
            end
        end
        k_first = t2;

        %Step 2b
        t1 = tmp_loc + 1;
        while 1
            [M_value, loc] = max_D(data, t1, T);
            if M_value < D_star
                break;
            else
                t1 = loc + 1;
            end
        end
        k_last = t1 - 1;
        %Step 2c
        if k_first == k_last
            cp = cp;
        elseif k_first < k_last
            cp = [cp k_first k_last];
            t1 = k_first + 1;
            T = k_last;
            [cp] = step1_2a_2b(data, t1, T, D_star, cp);
        end
    end
    cp = [unique(cp)];
end