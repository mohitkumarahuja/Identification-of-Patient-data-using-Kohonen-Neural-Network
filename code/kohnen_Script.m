
%%%%%% Visual Perception %%%%%
%%%%%%%% Project-1,2,3 %%%%%%%
%%%%%  Mohit Kumar Ahuja %%%%%
%%%%%%%%%    MSCV    %%%%%%%%%

close all;
clear;
clc;

%% Project 1 :

W = [1,1,0,0
     0,0,0,1
     1,0,0,0
     0,0,1,1];                  % Training Data

Z = [0 0 0 0.9
     0 0 0.8 0.9
     0.7 0 0 0
     0.7 0.9 0 0];              % Test Data

kohnen_proj_1(W,Z)              % To know more about this function type 
                                % help kohnen_proj_1 in Command Window
 
 %% Project 2 :

W = load('control.txt');         % Training data for Healthy people
Z = load('patient.txt');         % Training data for patients

%% Project 3 :

Y = load('mohit.txt');           % Test Data
% Y = load('Copy_of_mohit.txt');% Uncomment and check for 3rd row which I
                                 % replaced by patient data

X = kohnen_proj_2and3( W,Z,Y );  % To know more about this function type 
                                 % help kohnen_proj_2and3 in Command Window

%%%%%%%%%%%%%%%%%%%%%%%% Thank You For Your Time %%%%%%%%%%%%%%%%%%%%%%%%%%
