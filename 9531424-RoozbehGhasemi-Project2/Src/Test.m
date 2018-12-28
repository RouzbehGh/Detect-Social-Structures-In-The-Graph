clc;
clear all;
close all;
warning('off');

%vorude data
Data=importdata('Epinions2.txt');

%tesase tupple data
len=size(Data,1);

col=0;
row=0;
%tedade Influence ha baraye rasme nemoodar
Influ_Num=5;
rep=2;
row(1)=0;
col(1)=0;
Influ=5;

%%
% LL=3;
% for uu=2:LL
%     pathCount(uu-1) = PathMin(Data,Influ,8,uu)    
% end
% min_path=min(pathCount)


%%
% a=[1 12 23 32 50];
% b=[12 23 45 50 65];
% GreadyAlgorithm(Data,5)

%% ------------------ Test Random Algorithm ---------------------
%Random_Algorithm(Data,5)


MaxDegree_Algorithm(Data,5)

