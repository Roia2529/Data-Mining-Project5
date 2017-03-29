load A.dat
%result=zeros(10,1);
[U,S,V] = svd(A);
%k=1~10
k=2;
U2 = U(:,1:k);
S2 = S(1:k,1:k);
V2 = V(:,1:k);
P2 = A*V2;

scatter(P2(:,1),P2(:,2));

%sdia=diag(S2)
