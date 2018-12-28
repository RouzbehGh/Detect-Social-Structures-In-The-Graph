function Q = Cal_QSStar(user,Dataset)
    %mohasebeye QS*
    ucount=0;
    vc=1;
    n=size(Dataset,1);
    for j=1:n
        if(Dataset(j,1)==user)  %barresiye inke user koja vaghe shode ast
            uu=Dataset(j,2);
            ucc=ShowRelatedUsers(uu,Dataset);
            if(size(ucc,2)>0)
                ucount(vc)=uu;
                vc=vc+1;
            end
        end
        %barresiye inke vaghti usere morede nazar peymayesh shod digar barname
        %ta akhar dataset ra barresi nakonad
        if(j>1)
            if(Dataset(j,1)~=user && Dataset(j-1,1)==user)
                break;
            end
        end
    end      
    %u=size(ucount,2);
    Q=ucount;    
end

