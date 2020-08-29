function [sdp, sdn] = sd_bands(data, cp)
    cp = [0 cp length(data)];
    N = length(cp);
    for i = 1:N-1
        sdp(cp(i)+1:cp(i+1)) = 3*std(data(cp(i)+1:cp(i+1)));
        sdn(cp(i)+1:cp(i+1)) = -sdp(cp(i)+1:cp(i+1));
    end
end

        

