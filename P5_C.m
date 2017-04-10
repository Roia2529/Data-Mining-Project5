load A.dat
%result=zeros(10,1);
[U,S,V] = svd(A);
%k=1~10
k=2;
U2 = U(:,1:k);
S2 = S(1:k,1:k);
V2 = V(:,1:k);
A_2 = U2*S2;
AT=A*V2;
scatter(A_2(:,1),A_2(:,2));
  
