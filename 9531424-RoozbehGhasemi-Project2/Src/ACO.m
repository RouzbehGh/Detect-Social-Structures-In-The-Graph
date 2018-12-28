clc;
clear;
close all;

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

%% dar in halghe algorithme ACO ejra shode va behbood dade mishavad
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
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    pause(0.01);
    
end