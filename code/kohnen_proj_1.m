function  kohnen_proj_1( W,Z )
% This function is programmed by Mohit Kumar Ahuja
% To Run this Function you need to give input Training data for example:
% W = [1,1,0,0
%     0,0,0,1
%     1,0,0,0
%     0,0,1,1]; 
%
% And Test Data:
% Z = [0 0 0 0.9
%      0 0 0.8 0.9
%      0.7 0 0 0
%      0.7 0.9 0 0];
%
% Then you need to run this function as
% kohnen_proj_1(W,Z)
% Where W is the training set and Z is test set


%%%%%% Visual Perception %%%%%
%%%%%%%%% Project-1 %%%%%%%%%%
%%%%%  Mohit Kumar Ahuja %%%%%
%%%%%%%%%    MSCV    %%%%%%%%%


%% 1) Construct a Kohonen network in order to carry out the classification of the vectors 

% W is given as a input matrix by user
disp('               Project 1:'); % Displaying Project number
disp(' ');
disp(' ');
Input_Vectors = size(W,1);   % Input classes
Output_Vectors = 2;          % Output classes
Learn_Rate = 0.8;            % Learning Rate

disp('Initial Random Weight matrix is:');
weights = mod(randn(Output_Vectors,Input_Vectors), 1) % Initial Weight matrix
% mod(x,y) gives a output of all +ve integers

Iterations = 50;           % Number of Iterations

for iter = 1:Iterations     % For every input vector
    for N = 1:size(W,1)     % Its distance from every weight vector
        for k = 1:size(weights,1)
            D(k) = sum((W(N,:) - weights(k,:)).^2); % Euclidian Distance
        end
        if D(1)>D(2) % Finding the closest weight vector
            weights(2,:) = (weights(2,:) + (Learn_Rate*(W(N,:) - weights(2,:))));
            % Updating the current weight vector while leaving other unchanged
        else
            weights(1,:) = (weights(1,:) + (Learn_Rate*(W(N,:) - weights(1,:))));
            % Updating the current weight vector while leaving other unchanged
        end
        
        Learn_Rate = 0.9 * Learn_Rate; % To reduce the learning rate
        
    end
end

disp(['Learned Weight matrix is:']);
weights = round((weights*100))./100  % Learned Weights

a = [W(1,:)
    W(3,:)];
X = mean(a(1:2,:));        % Taking mean of first learning cluster

if weights(1,:) == X       % Comparing that mean value with cluster output
    cluster1 = 'Class 2';  % If there will be changes in weight vector the
    cluster2 = 'Class 1';  % Values assigned to output clusters will reversed
end
if weights(2,:) == X
    cluster1 = 'Class 1';
    cluster2 = 'Class 2';
end
    



%% 2) Once the training is completed carry out a test with the vectors

disp('Test Data for project 1:');
Z                       % Z is given by User
disp('Results: ');
for N = 1:size(Z,1)     % Its distance from every weight vector
    for k = 1:size(weights,1)
        D(k) = sum((Z(N,:) - weights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)        % Finding the closest weight vector
        disp(['[',num2str(Z(N,:)),' ] This Vector Belongs to ',cluster1]);
    else
        disp(['[',num2str(Z(N,:)),' ] This Vector Belongs to ',cluster2]);
    end
end
disp(' ');              % Providing some space. Nothing more than that
disp(' ');              % Providing some space. Nothing more than that
end

%%%%%%%%%%%%%%%%%%%%%%%% Thank You For Your Time %%%%%%%%%%%%%%%%%%%%%%%%%%
