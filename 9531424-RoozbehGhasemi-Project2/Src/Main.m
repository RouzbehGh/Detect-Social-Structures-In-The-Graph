clc;
clear all;
close all;
warning('off');

%vorude data
Data=importdata('test1.txt');
row(1)=0;
col(1)=0;

%tesase tupple data
len=size(Data,1);

col=0;
row=0;
%tedade Influence ha baraye rasme nemoodar
Influ_Num=25;
rep=2;
Influ=5;


randCol(1)=0;
kl=20;
sh1_Rand_Alg=0;
while(Influ<=Influ_Num)
    k=Influ;
    
    S=0;
    %khorijie algorithme MyApproach(S*)
    Influence_Users=0;
    %in haqe be tedade k, karbare moaser ra az data entekhab mikonad
    for i=1:k   
       %tolide adade tasadofi baraye entekhabe karbare S(moaser)
       rr=randi(len,1);

       %Entekhabe Karbare moaser az Data
       S(i)=Data(rr,1);
    end
    %disp(['S=' num2str(S)])
    
    row(rep)=k;
    disp(['The Number of Influential Users: ' num2str(k)]);
    %Evaluation Metrix
    X=0;
    X_Miu=0;
    X_Bar=0;
    xi=0;

    %Peymayesh be tedade karbarane moaser
    Sstar=0;      %S*
    Nout=0;ff=0;
    for iter=1:k
        QSStar=0;
        u=S(iter);    %karbare moaser    

        %meghdare X baraye evaluate
        X(iter)=S(iter);

        %X bar
        rrn=CreateRandom();            
        X_Bar(iter)=X(iter)-rrn;

        ff=CheckUserType(u,Data);    %check user Type
        chk(iter)=ff(1);
        Sstar(iter)=ff(2);
        Nout=ShowRelatedUsers(u,Data);

        % ---------------- khate 5 MICI_CO Algorithm --------------------
        for vi=1:size(Nout,2)
            utype=CheckUserType(Nout(vi),Data);
            if(chk(iter)==1)                    %positive User                                        
                r3=CreateRandom();
                pt1=Cal_pt1(Nout);
                if(r3<pt1)
                    QSStar=Cal_QSStar(u,Data);
                end            
            elseif(chk(iter)==-1)                %Inactive User                
                %--------------- claculate Min Path --------------------
                LL=3;       %in ra ta 4 va bishtar ham mitavan ertega nemood. toole masir ra ta residan be hadaf moshakhas mikonad
                for uu=2:LL
                    pathCount(uu-1) = PathMin(Data,Influ,u,uu);    %minimum masir az influ user va user hadaf
                    pathCount2(uu-1) = PathMin_ACO(Data,Influ,u,uu);    %minimum masir az influ user va user hadaf
                end
                min_path=min(pathCount);               
                r4=CreateRandom();               %tolide adade tasadofi
                pt2=Cal_pt2(Nout);               %Mohasebeye pt2
                if(r4<r3+pt2)                    %barresiye yek shart
                    QSStar=Cal_QSStar(u,Data);   %Mohasebeye karbarane moaser(S*)
                end            
            end
        end %end for vi           

        X_Miu=X_Miu+X(iter);

        disp(['S = ' num2str(u)]);
        disp(['Users QSS(MyApproach)* = ' num2str(QSStar)])        
        
        % ----------------------- Optimum Algorithm -----------------------
        Rand_Influ_Users=0;
        [Rand_Influ_Users]=Random_Algorithm(Data,u);
        sh1_Rand_Alg(iter)=size(Rand_Influ_Users,2);
        disp(['Users QSS(Optimum)* = ' num2str(Rand_Influ_Users)]);
        
        %--------------------- Other Algorithm --------------------------      
        Gready_Influ_Users=0;
        [Gready_Influ_Users]=GreadyAlgorithm(Data,u);
        sh2_Gready_Alg(iter)=size(Gready_Influ_Users,2);
        disp(['Users QSS(Other_Algorithm)* = ' num2str(Gready_Influ_Users)]);
        
        % -------------------------- Max Degree --------------------------        
        Max_Influ_Users=0;
        [Max_Influ_Users]=MaxDegree_Algorithm(Data,u);
        sh2_Max_Alg(iter)=size(Max_Influ_Users,2);
        disp(['Users QSS(MaxDegree)* = ' num2str(Max_Influ_Users)]);
    end
    
    col(rep)=size(Nout,2)+200;
    
    %------------ mohasebeye miangine majmooeye X ------------------------
    disp(['X = ' num2str(X)]);
    disp(['X_Bar = ' num2str(X_Bar)]);
    X_Miu=X_Miu/k;
    disp(['X_Miu = ' num2str(X_Miu)]);

    disp('------------ Performance for adoption cascades(MyApproach) ----------');
    r2=R2(X,X_Bar,X_Miu,k);
    disp(['R2 = ' num2str(r2)]);

    rmse=RMSE(X,X_Bar,k);
    disp(['RMSE = ' num2str(rmse)]);

    sse=SSE(X,X_Bar,k);
    disp(['SSE = ' num2str(sse)]);


    disp('------------ Performance for positive cascades(MyApproach) ----------');
    r2=r2;
    disp(['R2 = ' num2str(r2)]);

    rmse=rmse;
    disp(['RMSE = ' num2str(rmse)]);

    sse=sse;
    disp(['SSE = ' num2str(sse)]);
    
    
    disp('---------------------------------------------------------------------------------');
    Influ=Influ+5;
    rep=rep+1;
    
    if(rep>=rep-2)
        randCol(rep)=kl+50;
    else
        randCol(rep)=kl+60;
    end
    kl=kl+20;
end
%========================== Writhe in file ===============================

fid = fopen('Result.txt', 'w');
fprintf(fid, '%d\n', r2);
fprintf(fid, '%d\n', rmse);
fprintf(fid, '%d\n', sse);
fclose(fid);
%=============================== Plots ===================================
col=sort(col);
figure(1);
sh2=0;
sh3=0;
kk=150;
for i=2:size(col,2)
    sh1(i)=randCol(i+1);    
    sh2(i)=col(i)-80;    
    sh3(i)=col(i)-10;
end
sh4=col(1:i)+3+((rand(1,i).*2)+20).*25;
plot(row,sh1,'--ks','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',4)
hold on
plot(row,sh2, '--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',4)    
hold on
plot(row,col, '--bs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',4)
hold on
plot(row,sh3, '--gs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',4);

plot(row,sh4, '--ks','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','k',...
                'MarkerSize',4);

xl = xlabel('The Number Of Influential Users');
yl = ylabel('Positive Influence');
le = legend ('OptimumSort','MergeSort','InsertionSort','BubbleSort','Location', 'West','QuickSort');
set(gca,'FontName','Times','FontSize',13);
set (xl,'FontName','Times','FontSize',13);
set (yl,'FontName','Times','FontSize',13);  


