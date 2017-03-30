load X.dat
load Y.dat

%Least Square

C=inv(X' * X)*X'*Y;
errorC=norm(Y - X*C,2)

%Ridge
s = [0.1; 0.3; 0.5; 1.0; 2.0];
e_Cs=zeros(1,5);
for i=1:5
C=inv(X'*X + s(i)^2*eye(12))*X'*Y;
e_Cs(i)=norm(Y - X*C,2);
end

e_Cs