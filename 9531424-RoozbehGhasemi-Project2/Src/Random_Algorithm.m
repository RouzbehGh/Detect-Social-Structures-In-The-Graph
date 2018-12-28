function [Users] = Random_Algorithm(Data,S_user)
    
    %userhayi ke S_user ra tahte tasir gharar midahand
    [user_list]=ShowRelatedUsers(S_user,Data);
    
    % dar in ghesmat az koliyeye karbarani ke vi ra tahte tasir gharar
    % midahahnd yek tedadi ra entekhab mikonad be soorate tasadofi
    p=size(user_list,2)/4;
    %rond kardane kasr
    p=round(p);
    %tedade kole Influence Users
    top_k=size(user_list,2);
    %Entekhabe tasadofi users
    for i=1:p
        rr=randi(top_k,1);
        user_list(rr)=0;
    end        
    newlist=0;
    %tilode liste nahayi
    c=1;
    for i=1:size(user_list,2)
        if(user_list(i)~=0)
            newlist(c)=user_list(i);
            c=c+1;
        end        
    end
    Users=newlist;
end

