function [Users] = MaxDegree_Algorithm(Data,S_user)
    %userhayi ke S_user ra tahte tasir gharar midahand
    [user_list]=ShowRelatedUsers(S_user,Data);
        
    %tedade kole Influence Users
    top_k=size(user_list,2);
    
    list_New=0;
    %Entekhabe tasadofi users
    max=0;
    max_user=0;
    for i=1:top_k
        count_User=ShowRelatedUsers(user_list(i),Data);
        list_New(i)=size(count_User,2);
        if(size(count_User,2)>max)
           max= size(count_User,2);          
           max_user=user_list(i);
        end
    end        

    %select Max Degree Users
    
    Users=ShowRelatedUsers(max_user,Data);
    
end

