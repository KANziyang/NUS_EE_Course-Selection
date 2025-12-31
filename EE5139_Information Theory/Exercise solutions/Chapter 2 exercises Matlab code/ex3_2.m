%%%Exercise 3.2 prefix code%%%

pp=[8.4,1.5,2.2,4.2,11,2.2,2.0,6,7.4,0.1,1.3,4,2.4,6.7,7.4,1.9,0.1,7.5, ...
    6.2,9.2,2.7,0.9,2.5,0.1,2,0.1];
A='a':'z';
AA=mat2cell(A,1,ones(26,1));
AAA=[];

%sort probabilities and record the index
[pp0,pindex]=sort(pp,'descend');

%generate codewords
code={};
for i=1:4
    code(2^i-1:(2^i-1)*2)=cellstr(dec2bin(0:2^i-1));
end
code=code(1:26);

%combine symbols and codewords
for i=1:26
    AA(2,pindex(i))=cellstr([cell2mat(code(i)),'_']);
end

%expected length
Sum=0;
for i=1:26
    Sum=Sum+pp(i)*length(cell2mat(AA(2,i)));
end
Sum=Sum/100;

%expected time
time=0;
for i=1:26
   t0=2*length(find(cell2mat(AA(2,i))=='0'));
   t1=4*length(find(cell2mat(AA(2,i))=='1'));
   time=time+pp(i)/100*(t0+t1);
end
time=time+3

