function u=membership_fun(x,center)
%采用的隶属度函数,输入单个集合的中心和输入量，返回在该集合上的隶属度,这里采用三角隶属度函数
    variance=1;%方差（每个三角形的半宽）

    if abs(x-center)>variance
        u=0;
    else
        u=1-1*abs(x-center)/variance;
    end

end
    

