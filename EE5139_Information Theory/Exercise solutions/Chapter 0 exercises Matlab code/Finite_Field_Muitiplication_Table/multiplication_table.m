p = 3;
degree = 1; % Thus the size of the field is p^(degree+1)
h = [1,0,1]; % The irriducible polynomial of degree 'degree+1'
% List all polynomials
F = zeros(p^(degree+1),degree+1);
for i = 1:p^(degree+1)
    m = i-1;
    for j = 1:degree+1
        F(i,j) = mod(m,p);
        m = (m-mod(m,p))/p;
    end
end
m_table = zeros(p^(degree+1));
for i = 1:p^(degree+1)
    for j = 1:p^(degree+1)
        f = polyMod(polyMultiply(F(i,:),F(j,:),p),h,p);
        [~,k] = ismember(f,F,'rows');
        m_table(i,j) = k-1;
    end
end
disp(m_table);