function d_PID=fuzzy_control_cal(iError)
%使用模糊方法计算PID参数的增量
    
    global PID_
    %iError=[0.3,5];

    Error_range=[-0.2 0.2];
    
    error=iError(1);%误差
    derror=iError(2);%误差导数
    scaler_set=[-3 -2 -1 0 1 2 3];%量化等级
    [m,n]=size(scaler_set);
    Control_membership_table=zeros(n,n);
    
    %每个等级控制的隶属度向量
    for i=1:n
        Control_membership_table(i,:)=cal_membership(i-4,scaler_set);
    end
    
    %推理规则集
    P_rule=-[-3 -3 -3 -2 -2 0 0;
            -3 -3 -2 -2 -1 0 0;
            -3 -3 -1 -1 0 1 2;
            -3 -2 -1 0 1 2 3;
            -2 -1 0 1 1 3 3;
            0 0 1 2 2 3 3;
            0 0 2 2 3 3 3;];
        
    I_rule=[-3 -3 -3 -2 -2 0 0;
            -3 -3 -2 -2 -1 0 0;
            -3 -3 -1 -1 0 1 2;
            -3 -2 -1 0 1 2 3;
            -2 -1 0 1 1 3 3;
            0 0 1 2 2 3 3;
            0 0 2 2 3 3 3;];
        
    D_rule=[1    -1    -3    -3    -3    -2     1
         1    -1    -3    -2    -2    -1     0
         0    -1    -2    -2    -1    -1     0
         0    -1    -1    -1    -1    -1     0
         0     0     0     0     0     0     0
         3    -1     1     1     1     1     3
         3     2     2     2     1     1     3];
    
    %PID参数的论域
    P_set=linspace(-1,1,n);
    D_set=linspace(-0.1,0.1,n);
    I_set=linspace(-0.1,0.1,n);
    
    error_scaler=scaler(error,Error_range(1),Error_range(2),scaler_set);%误差非均匀量化到[-3，3]
    derror_scaler=scaler(derror,2*Error_range(1),2*Error_range(2),scaler_set);
    %这里derror的范围取为error的2倍
    error_membership=cal_membership(error_scaler,scaler_set);%模糊化——求误差隶属度
    %display(error_membership);
    derror_membership=cal_membership(derror_scaler,scaler_set);

    
    E_membership=zeros(2*m,n);
    E_membership(1,:)=error_membership;
    E_membership(2,:)=derror_membership;

    
    %模糊推理
    out_p=cal_out(scaler_set,P_rule,E_membership);
    out_p=P_set*out_p'/sum(out_p);%重心法进行反模糊化，求得out精确值

    
    out_i=cal_out(scaler_set,I_rule,E_membership);
    out_i=I_set*out_i'/sum(out_i);%重心法进行反模糊化，求得out精确值

    out_d=cal_out(scaler_set,D_rule,E_membership);
    out_d=D_set*out_d'/sum(out_d);%重心法进行反模糊化，求得out精确值
    
    
    d_PID=zeros(1,3);%PID参数的增量

    d_PID(1)=out_p*0.1;%乘的系数用作变相调整论域
    %d_PID(2)=PID_.Ts*out_i;
    d_PID(2)=0;
    d_PID(3)=out_d*5*0.01;

end
