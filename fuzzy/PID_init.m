global PID_

PID_.P_opt=-17;
PID_.I_opt=-0.1;
PID_.D_opt=-0.5;
PID_.P=PID_.P_opt;
PID_.I=PID_.I_opt;
PID_.D=PID_.D_opt;
PID_.e_sum=0;
PID_.e_sum_best=1000;
PID_.Ts=0.01;


%随时间变化的PID参数
global PID_para_save
PID_para_save(1,1)=PID_.P_opt;
PID_para_save(1,2)=PID_.I_opt;
PID_para_save(1,3)=PID_.D_opt;
%计数用
global count
count=0;

