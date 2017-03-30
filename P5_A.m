load A.dat
result=zeros(10,1);
normA=norm(A,2)*0.1
[U,S,V] = svd(A);
%k=1~10
for k=2:10
Uk = U(:,1:k);
Sk = S(1:k,1:k);
Vk = V(:,1:k);
Ak = Uk*Sk*Vk';
result(k)=norm(A-Ak,2);
    if result(k)<=normA
        k
    end 
end

%result

