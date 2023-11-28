function out=fuzzy_pid(iError)
    persistent iError1%上一次误差值
    global count
    global PID_
    global PID_para_save
    
    if isempty(iError1)
        iError1=0;
    end
    
    e=iError(1);
    
    PID_.e_sum=PID_.e_sum+e*0.1;
    
    
   
    
    count=count+1;
    %PID参数自整定
    d_PID=fuzzy_control_cal(iError);
    PID_.P=PID_.P+d_PID(1);
    PID_.I=PID_.I+d_PID(2);%I的值在另一个S-function中使用
    PID_.D=PID_.D+d_PID(3);
    p=PID_.P;
    i=PID_.I;
    d=PID_.D;
    
     %存储此时的PID参数
    PID_para_save(count+1,1)=PID_.P;
    PID_para_save(count+1,2)=PID_.I;
    PID_para_save(count+1,3)=PID_.D;



    
    %输出值
    out=p*e+d*(e-iError1)/PID_.Ts;
    iError1=e;
   
end