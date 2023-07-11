function [a] = randmat (n,m) 

a=zeros(n,m);
for i=1:n
    for j=1:m
        a(i,j)=rand;
        %disp(a)
        if a(i,j)<=1/6
            a(i,j)=1;
        elseif ((a(i,j) > 1/6) && (a(i,j) <= 5/6))
            a(i,j)=0;
        elseif a(i,j)> 5/6
            a(i,j)=-1;
        end
    end
end
%disp(a)
a=a*sqrt(1/n);
% a=a*0.1*sqrt(1/n);
return
