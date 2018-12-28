function t = CheckUserType(user,Dataset)
    %in tasbe barresi mikonad ke Aya yek user
    %P(positive),N(Negative),I(Inactive) ast ya kheir
    chk=ismember(user,Dataset(:,1));
    %Inactive User=0, Positive User=1 ,Negative User=-1
    ru=0;
    related_Users=0;

    if(chk==0)%karbar inactive ya I ast
        t(1)=0;
    else
        %namayeshe liste karbarane tahte tasir
        related_Users=ShowRelatedUsers(user,Dataset);
        re=size(related_Users,2);
        if(re~=0)
           %peymayesh dar karbarane tahte tasir
           kk=size(related_Users,1);
           for y=1:kk
               %estekhraje karbarane mortebet be karbarane tahte tasir
               ru=ShowRelatedUsers(related_Users(y),Dataset);
               %barresiye mosbat ya P boodane user
               if(size(ru,2)~=0)
                   t(1)=1;
                   break;
               else %barresiye manfi ya N boodane user
                   t(1)=-1;
                   break;
               end           
           end
        else
            t(1)=-1;
        end    
    end
    t(2)=size(related_Users,2);
end
