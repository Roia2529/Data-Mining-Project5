load X.dat
load Y.dat

%Set
X1 = X(1:66,:);
Y1 = Y(1:66);
X2 = X(34:100,:);
Y2 = Y(34:100);
X3 = [X(1:33,:); X(67:100,:)];
Y3 = [Y(1:33); Y(67:100)];

%remain set
X1_remain=X(67:100,:);
Y1_remain=Y(67:100,:);
X2_remain=X(1:33,:);
Y2_remain=Y(1:33,:);
X3_remain=X(34:66,:);
Y3_remain=Y(34:66,:);

%Least Square
C_LS1=inv(X1' * X1)*X1'*Y1;
C_LS2=inv(X2' * X2)*X2'*Y2;
C_LS3=inv(X3' * X3)*X3'*Y3;

e_LS=zeros(1,3);
e_LS(1)=norm(Y1_remain - X1_remain*C_LS1,2);
e_LS(2)=norm(Y2_remain - X2_remain*C_LS2,2);
e_LS(3)=norm(Y3_remain - X3_remain*C_LS3,2);


e_LS_avg=mean(e_LS);

%Ridge
s = [0.1; 0.3; 0.5; 1.0; 2.0];
e_CS=zeros(5,3);
for i=1:5
    C_R1=inv(X1'*X1 + s(i)^2*eye(12))*X1'*Y1;
    C_R2=inv(X2'*X2 + s(i)^2*eye(12))*X2'*Y2;
    C_R3=inv(X3'*X3 + s(i)^2*eye(12))*X3'*Y3;

    e_CS(i,1)=norm(Y1_remain - X1_remain*C_R1,2);
    e_CS(i,2)=norm(Y2_remain - X2_remain*C_R2,2);
    e_CS(i,3)=norm(Y3_remain - X3_remain*C_R3,2);
    
    %e_CS(i)=(e_R12+e_R13+e_R21+e_R23+e_R31+e_R32)/6;
end

e_CS

