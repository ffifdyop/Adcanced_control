

%第一题
A=[1 0.7 0.4];
B=[0.8 1 0.3];
In=[0.2 0.6 1];
% A=[6 7 8;1 2 5];
% In=[7 5 3;3 5 4];
out_set=[30,40,50];
out_membership=Fuzzy_reasoning(In,A,B);

display(out_membership)
out=out_set*out_membership'/sum(out_membership);%重心法进行反模糊化，求得out精确值
% display(out);
fprintf('The accurate output is: %.2f',out);





          