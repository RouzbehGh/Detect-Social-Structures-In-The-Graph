%% Path Min Function
function pathCount = PathMin_ACO(Data,S,Vj,i)
    %hamsayehaye S
    pathCount=0;
    [N] = GetNeibors(Data,S); 
    T=0;
    tc=1;    
    %% Problem Definition
    model=CreateModel();
    CostFunction=@(p) MyCost(p,model);
    nVar=model.n;

    %% ACO Parameters
    tMax=100;      % Maximum Number of Iterations
    AntCount=50;        % Number of Ants (Population Size)
    Q=1;
    tau0=10;        % Initial Phromone
    alpha=0.3;      % Phromone Exponential Weight
    rho=0.1;        % Evaporation Rate

    %% Initialization
    tau=tau0*ones(model.m,nVar);
    BestCost=zeros(tMax,1);    % Array to Hold Best Cost Values

    % Empty Ant
    empty_ant.Tour=[];
    empty_ant.Cost=[];

    % Ant Colony Matrix
    ant=repmat(empty_ant,AntCount,1);
    % Best Ant
    BestSol.Cost=inf;
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
    
    for it=1:tMax
    % Move Ants
    for k=1:AntCount
        
        ant(k).Tour=[];
        
        for l=1:nVar
            
            P=tau(:,l).^alpha;
            
            P(ant(k).Tour)=0;
            
            P=P/sum(P);
            
            j=RouletteWheelSelection(P);
            
            ant(k).Tour=[ant(k).Tour j];
            
        end
        
        ant(k).Cost=CostFunction(ant(k).Tour);
        
        if ant(k).Cost<BestSol.Cost
            BestSol=ant(k);
        end
        
    end
    
    % behbude ACO
    for k=1:AntCount        
        tour=ant(k).Tour;        
        for l=1:nVar            
            tau(tour(l),l)=tau(tour(l),l)+Q/ant(k).Cost;            
        end        
    end
    
    % Evaporation
    tau=(1-rho)*tau;
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost/10;
    pause(0.01);
    
    end

end

