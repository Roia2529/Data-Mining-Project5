function [B] = FD(A,l)
  [n,d] = size(A);
  B = zeros(2*l,d);
  B(1:2*l-1,:)=A(1:2*l-1,:);
  % fill in the rest here
  compare=zeros(1,d);
  for i=2*l:n
      %update=0;
      full = 0;
      for j=1:2*l
          %if update~=1
              if B(j,:)==compare
               B(j,:)=A(i,:);
               %update=1;
               if j==2*l %last row
                  full=1;
               end 
               break
              end
          %end    
      end    
      if full==1   
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

