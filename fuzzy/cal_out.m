function out_membership=cal_out(scaler_set,PID_rule,E_membership)
%计算推理输出隶属度向量
%scaler_set:量化等级向量；
%PID_rule:PID参数模糊规则集；
%E_membership:误差隶属度向量，第一行为e隶属度，第二行为ec隶属度

[m,n]=size(scaler_set);
out_membership=zeros(49,7);
t=1;
for i=1:7
    for j=1:7
        A=zeros(2*m,n);
        A(1,:)=cal_membership(i-4,scaler_set);
        A(2,:)=cal_membership(j-4,scaler_set);
        B=cal_membership(PID_rule(i,j),scaler_set);
        out_membership(t,:)=Fuzzy_reasoning(E_membership,A,B);%每一行各是一条规则推导出的隶属度向量
        t=t+1;
    end
end
%display(out_membership);
out_membership=max(out_membership);%对7*7=49条规则得到的结果进行最大合成

end