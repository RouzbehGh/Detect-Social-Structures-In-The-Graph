% Get Neibor List of V_i
function [NN] = GetNeibors(Data,V_i)
    s=size(Data,1);
    NN=0;    
    b=0;
    c=1;
    for i=1:s
        node=Data(i,1);        
        if(node==V_i)           
            b=1;
            NN(c)=Data(i,2);           
            c=c+1;
        elseif(b==1 && node~=V_i)
            break;
        end
    end   
end
