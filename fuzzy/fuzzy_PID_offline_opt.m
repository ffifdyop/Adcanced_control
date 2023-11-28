function fuzzy_PID_offline_opt()
%存储离线优化参数结构体PID_
global PID_

%如果新参数下误差积分最大值比旧参数下小，说明新参数表现好，新参数替代旧参数
if abs(PID_.e_sum_best)>abs(PID_.e_sum)
    PID_.P_opt=PID_.P;
    PID_.D_opt=PID_.D;
    PID_.e_sum_best=PID_.e_sum;
end

%旧参数和新参数性能差距很小
if abs(abs(PID_.e_sum_best)-abs(PID_.e_sum))<0.1
    PID_.P=PID_.P_opt;
    PID_.D=PID_.D_opt;
end

% %如果最大误差过大，说明y发散了，PID增益过小，因此要增大比例增益
% if abs(PID.Error_peek)>10
%     PID_save.P=PID_save.P*2;
%     PID_save.D=PID_save.D*1.3;
% end


save('PID_para','PID_');
end