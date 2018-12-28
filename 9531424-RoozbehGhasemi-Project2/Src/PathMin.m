%% Path Min Function
function pathCount = PathMin(Data,S,Vj,i)
    %hamsayehaye S
    pathCount=0;
    [N] = GetNeibors(Data,S); 
    T=0;
    tc=1;    
    if(i==2)
        for m=1:size(N,2)
            Vt=N(m);
            [N2]=GetNeibors(Data,Vt);
            c1 = CheckingFriend(N2,Vj);
            if(c1==1)
                pathCount=pathCount+1;
            end
        end  
    elseif(i==3)
        for m1=1:size(N,2)
            Vt=N(m1);            
            T(tc)=Vt;
            tc=tc+1;
            if(Vt~=S)
                [N2]=GetNeibors(Data,Vt);
                for m2=1:size(N2,2)
                    Vt1=N2(m2);
                    T(tc)=Vt;
                    tc=tc+1;
                    if(Vt1~=Vt && Vt1~=S)
                        [N3]=GetNeibors(Data,Vt1);
                        c1 = CheckingFriend(N3,Vj);
                        c2=CheckingFriend(T,Vj);
                        if(c1==1 && c2==0)
                            pathCount=pathCount+1;
                        end
                    end
                end            
            end
        end      
    elseif(i>=4)
        for m1=1:size(N,2)
            Vt=N(m1);
            if(Vt~=S)
                [N2]=GetNeibors(Data,Vt);
                for m2=1:size(N2,2)
                    Vt1=N2(m2);
                    if(Vt1~=Vt && Vt1~=S)
                        [N3]=GetNeibors(Data,Vt1);
                        for m3=1:size(N3,2)                
                            Vt2=N3(m3);
                            if(Vt1~=Vt2 && Vt2~=S && Vt2~=Vt)
                                [N4]=GetNeibors(Data,Vt2);
                                for m4=1:size(N4,2)  
                                    Vt3=N4(m4);
                                    if(Vt3~=Vt2 && Vt3~=Vt1 && Vt3~=Vt && Vt3~=S)
                                        [N5]=GetNeibors(Data,Vt3);
                                        c1 = CheckingFriend(N5,Vj);
                                        if(c1==1)
                                            pathCount=pathCount+1;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end    
            end
        end             
    end
end

