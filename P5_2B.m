load A.dat
Af=norm(A, 'fro')^2;
[n,d] = size(A);
Af_ratio=Af*0.1
trials=40;
k=1000;
minus=ones(1,k)*Af_ratio;
e=zeros(1,k);

%l=10;
for l=400:k
    error_avg_l=0;
    for j=1:trials
        S=zeros(l,n);
        for i=1:l
        S(i,:) = sqrt(n/l)*rand(1,n);
        end
        B=S*A;
        error=norm(A'*A - B'*B, 2);
        pre_error=error_avg_l;
        error_avg_l=(error_avg_l*(j-1)+error)/j;
        if abs(pre_error-error_avg_l)<pre_error*0.001
            %j
        end
    end
    e(l)=error_avg_l;
end    

diff=e-minus


