
global count
global PID_para_save

%绘制报告里的所有图表

load('drawing_data');
%绘制PID参数变化曲线
len=size(PID_para_save(:,1));
t=linspace(0,35,len(1));
f1=figure();
subplot(3,1,1);
plot(t,PID_para_save(:,1),'k','Linewidth',1.5);%P
title('PID parameter P');
xlabel('t(s)');
ylabel('P');
subplot(3,1,2);
plot(e(:,1),e(:,2),'b','Linewidth',1.5);%e
title('error');
xlabel('t(s)');
ylabel('e');
subplot(3,1,3);
plot(de(:,1),de(:,2),'r','Linewidth',1.5);%de/dt
title('de/dt');
xlabel('t(s)');
ylabel('de/dt');

%plot(PID_para_save(:,2));%I

f2=figure();
subplot(3,1,1);
plot(t,PID_para_save(:,3),'k','Linewidth',1.5);%D
title('PID parameter D');
xlabel('t(s)');
ylabel('D');
subplot(3,1,2);
plot(e(:,1),e(:,2),'b','Linewidth',1.5);%e
title('error');
xlabel('t(s)');
ylabel('e');
subplot(3,1,3);
plot(de(:,1),de(:,2),'r','Linewidth',1.5);%de/dt
title('de/dt');
xlabel('t(s)');
ylabel('de/dt');

%模糊PID和PID对比，初始P=-17,D=-0.5
f3=figure();
plot(y_pid(:,1),y_pid(:,2),'--','Linewidth',0.8);
hold on
plot(y_fuzzy(:,1),y_fuzzy(:,2),'r','Linewidth',1.5);
legend('pid','fuzzy pid');
xlabel('t(s)');
ylabel('y(rad)');
title('P=-17,D=-0.5');
n=0.1;


%取消模糊PID参数p或d的更新
f4=figure();
subplot(2,1,1);
plot(y_pid(:,1),y_pid(:,2),'--','Linewidth',0.8);%普通pid
hold on
plot(y_fuzzy(:,1),y_fuzzy(:,2),'r','Linewidth',1);%模糊pid
hold on
plot(y_no_p(:,1),y_no_p(:,2),'k','Linewidth',1.5);%参数p不更新的模糊PID
hold on
xlabel('t(s)');
ylabel('y(rad)');
legend('pid','fuzzy pid','p is constant');
title('P=-17,D=-0.5,Fuzzy PID,P is constant');
subplot(2,1,2);
plot(y_no_d(:,1),y_no_d(:,2),'b','Linewidth',1);%参数d不更新的模糊PID
xlabel('t(s)');
ylabel('y(rad)');
title('P=-17,D=-0.5,Fuzzy PID,D is constant');
