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
a_table = zeros(p^(degree+1));
for i = 1:p^(degree+1)
    for j = 1:p^(degree+1)
        f = mod(F(i,:)+F(j,:),p);
        [~,k] = ismember(f,F,'rows');
        a_table(i,j) = k-1;
    end
end
disp(a_table);