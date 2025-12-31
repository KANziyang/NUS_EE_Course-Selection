function [ f ] = polyMultiply (g, h, p)
    % Multiply two polynomials on base field Fp where p is a prime number.
    g_degree = length(g)-1;
    h_degree = length(h)-1;
    f = zeros(1, g_degree + h_degree+1);
    for k = 0:(length(f)-1) % k-th order
        for a = max(0,k-h_degree):min(k,g_degree)
            b = k-a;
            f(k+1) = f(k+1) + g(a+1)*h(b+1);
        end
    end
    f = mod(f, p);
end