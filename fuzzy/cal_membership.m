function membership=cal_membership(x,set)
%计算隶属度，x为scaler后的输入，set为[-3,3](NB~PB)共7个量化等级
    [m,n]=size(set);
    membership=zeros(m,n);
    %如果输入值超过量化等级最大或最小范围，把NB或PB的隶属度设为1，其余设为0
    if x<=set(1)
        membership(1)=1;
        return;
    end
    if x>=set(n)
        membership(n)=1;
        return;
    end
    %fprintf('not max\n');
    %求取每个量化等级的隶属度
    for i=1:n
        membership(i)=membership_fun(x,set(i));
        %display(set(i));
    end
end
        
        

