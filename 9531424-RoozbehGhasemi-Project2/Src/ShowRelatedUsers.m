function [u] = ShowRelatedUsers(user,Dataset)
%in function kolliyeye karbarani ke user tahte tasir gharar dade ra
%barmigardanad
ucount=0;
vc=1;
n=size(Dataset,1);
for j=1:n
    if(Dataset(j,1)==user)  %barresiye inke user koja vaghe shode ast
        ucount(vc)=Dataset(j,2);    %qarar dadane karbarane tahte tasire user
        vc=vc+1;
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
u=ucount;
end

