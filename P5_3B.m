load X.dat
load Y.dat

X1 = X(1:66,:);
Y1 = Y(1:66);
X2 = X(34:100,:);
Y2 = Y(34:100);
X3 = [X(1:33,:); X(67:100,:)];
Y3 = [Y(1:33); Y(67:100)];

%Least Square
C_LS1=inv(X1' * X1)*X1'*Y1;
C_LS2=inv(X2' * X2)*X2'*Y2;
C_LS3=inv(X3' * X3)*X3'*Y3;

e_LS12=norm(Y2 - X2*C_LS1,2);
e_LS13=norm(Y3 - X3*C_LS1,2);
e_LS21=norm(Y1 - X1*C_LS2,2);
e_LS23=norm(Y3 - X3*C_LS2,2);
e_LS31=norm(Y1 - X1*C_LS3,2);
e_LS32=norm(Y2 - X2*C_LS3,2);

e_LS_avg=(e_LS12+e_LS13+e_LS21+e_LS23+e_LS31+e_LS32)/6

%Ridge
s = [0.1; 0.3; 0.5; 1.0; 2.0];
e_CS=zeros(1,5);
for i=1:5
    C_R1=inv(X1'*X1 + s(i)^2*eye(12))*X1'*Y1;
    C_R2=inv(X2'*X2 + s(i)^2*eye(12))*X2'*Y2;
    C_R3=inv(X3'*X3 + s(i)^2*eye(12))*X3'*Y3;

    e_R12=norm(Y2 - X2*C_R1,2);
    e_R13=norm(Y3 - X3*C_R1,2);
    e_R21=norm(Y1 - X1*C_R2,2);
    e_R23=norm(Y3 - X3*C_R2,2);
    e_R31=norm(Y1 - X1*C_R3,2);
    e_R32=norm(Y2 - X2*C_R3,2);
    
    e_CS(i)=(e_R12+e_R13+e_R21+e_R23+e_R31+e_R32)/6;
end

e_CS

