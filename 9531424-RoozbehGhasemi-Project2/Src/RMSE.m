function rmse = RMSE(X,X_Bar,n)
    %calculate RMSE Metric
    fs1=0;    
    c=10;
    %mohasebeye formule RMSE
    for i=1:n       
       fs1=fs1+((X(i)-X_Bar(i)).^2);              
    end
    rmse=(sqrt(fs1/n)+c);
end

