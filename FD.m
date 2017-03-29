function [B] = FD(A,l)
  [n,d] = size(A);

  B = zeros(2*l,d); 
  % fill in the rest here
  compare=zeros(1,d);
  for i=1:n
      update=0;
      for j=1:2*l
          if B(j,:)==compare
           B(j,:)=A(i,:);
           update=1;
           break
          end
      end    
      if update==0   
         [U,S,V] = svd(B);
         sigma=diag(S);
         sigma_l=sigma(l)^2;
         %I = eye(d)*sigma_l;
         for j=1:l-1;
            S(j,j)=sqrt(S(j,j)^2-sigma_l);
         end
         for j=l:d;
            S(j,j)=0;
         end
         B=S*V';
      end 
    
      
  end


end