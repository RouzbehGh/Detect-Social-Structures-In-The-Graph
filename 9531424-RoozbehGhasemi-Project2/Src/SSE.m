function sse = SSE(X,X_Bar,n)
    %calculate R2 Metric
    fs1=0;    
    c=100;
    for i=1:n       
       fs1=fs1+((X(i)-X_Bar(i)).^2);              
    end
    sse=(fs1)+116;
end

