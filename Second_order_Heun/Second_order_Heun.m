y = [1 0]; %1st column ��ֵ 2nd column ���
x = [0 0];
y_x = y; %�����ⷨ��ֵ
h = 0.1; %����
for n = 1:3
    K1=f(x(n,1),y(n,1));
    K2=f(x(n,1)+2/3*h,y(n,1)+2/3*h*K1);
    x(n+1,1)=x(n,1)+h;
    y(n+1,1)=y(n,1)+h/4*(K1+3*K2);
    y_x(n+1,1)=yx(x(n+1,1));
    y(n+1,2)=n; %�����
    x(n+1,2)=n; %�����
    y_x(n+1,2)=n; %�����
end
LB = zeros(n+1,4); %�б����
LB(:,1)=x(:,1); %x
LB(:,2)=y(:,1); %yn
LB(:,3)=y_x(:,1); %yx
LB(:,4)=y(:,2); %���