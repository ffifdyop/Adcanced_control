function out=Fuzzy_reasoning(in_membership,A_membership,B_membership)
%模糊蕴含关系生成采用最小运算法，推理采用最大最小合成,R:if x is A then y is B。x为向量（多输入）。输入A,in,B的隶属度函数，输出推理隶属度
    [m,n]=size(A_membership);
    temp=zeros(2,m,n);
    temp(1,:,:)=A_membership;
    temp(2,:,:)=in_membership;%temp第一行为A隶属度矩阵,第二行为in隶属度矩阵
    %display(temp);
    q_vector=max(min(temp),[],3); %q-vector为A,in的相似度向量[q1,q2...]
    %display(q_vector);
    q=min(q_vector);%q1,q2...中的最小值
    
    
    [m,n]=size(B_membership);
    %display(n);
    q_=repmat(q,1,n);
    temp=zeros(2*m,n);
    temp(1:m,:)=B_membership;
    temp(m+1,:)=q_;%temp第一行为B隶属度,第二行为q_
    out_membership=min(temp); %q和B做最小运算,得到out的隶属度函数
    out=out_membership;
    %out=out_set*out_membership'/sum(out_membership);%重心法进行反模糊化，求得out精确值


end
