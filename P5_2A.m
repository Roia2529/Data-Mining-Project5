load A.dat
Af=norm(A, 'fro')^2;
Af_ratio=Af*0.1;


for l=2:15
B=FD(A,l);
error=norm(A'*A - B'*B, 2);
    if error<Af_ratio
        l
        error
        Af_ratio
        break
    end
end


%%
[U,S,V] = svd(A);
%k=1~10
k=2;
U2 = U(:,1:k);
S2 = S(1:k,1:k);
V2 = V(:,1:k);
A2 = U2*S2*V2';
AF2=(norm(A-A2,'fro')^2)*0.1;

for l=2:50
B=FD(A,l);
error=norm(A'*A - B'*B, 2);
    if error<AF2
        l
        error
        AF2
        break
    end
end

