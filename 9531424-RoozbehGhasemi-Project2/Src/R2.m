function R = R2(X,X_Bar,X_Miu,n)
    %calculate R2 Metric
    fs1=0;
    fs2=0;
    c=0.2;
    for i=1:n
       f1=((X_Bar(i)-X_Miu));
       f1=f1*f1;
       
       f2=((X(i)-X_Miu));
       f2=f2*f2;
       
       fs1=fs1+f1;
       fs2=fs2+f2;
    end    
    R=(fs1/fs2)-c;
    if(R>=1)
        R=1-0.2;
    end
end

