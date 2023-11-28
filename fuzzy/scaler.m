function x_scaler=scaler(x,x_min,x_max,set)
%论域非均匀量化
    x_center=(x_min+x_max)/2;%x范围的中心点，若x定义域为对称区间,x_center=0
    set_range=set(end)-set(1);%量化等级的范围
    x_range=x_max-x_min;%x范围
    x_rel=x-x_center;%x相对于x_center的位移
    unbalance=1;
    unbalance=(1-exp(-2.7*abs(x_rel/x_range*2)))/(1-exp(-2.7));%非均匀量化系数,放缩到[0,1],|x|取最大值时为1,最小时为0
    %display(unbalance);
    x_scaler=sign(x)*unbalance*set_range/2;
end