function [ f ] = polyMod (g, h, p)
    % Find the modulo of polynomial g with respect to irriducible polynomial h on base field Fp where p is a prime number.
    g_length = length(g);
    h_length = length(h);
    while (max([g ~= 0].*[1:g_length]) >= h_length)
        d = max([g ~= 0].*[1:g_length]);
        C = g(d);
        h_shifted = zeros(size(g));
        h_shifted(d-h_length+1:d) = h;
        g = mod(g-C*h_shifted, p);
    end
    f = g(1: h_length-1);
end