function X = kohnen_proj_2and3( W,Z,Y )
% This function is programmed by Mohit Kumar Ahuja
% To Run this Function you need to give Training Data for example:
%
% W = load('control.txt');
% Z = load('patient.txt');
% Where W and Z are two classes of training set to compute Weights
% And Test Data as well for example:
%
% Y = load('mohit.txt');
% And then run this function as:
%
% X = kohnen_proj_2and3( W,Z,Y );

%%%%%% Visual Perception %%%%%
%%%%%%%%% Project-2,3 %%%%%%%%%%
%%%%%  Mohit Kumar Ahuja %%%%%
%%%%%%%%%    MSCV    %%%%%%%%%

% W and Z are given as a input training matrix by user
disp('               Project 2 and 3:'); % Displaying Project number
disp(' ');
disp('Control.txt and Patient.txt is given as training data ');
disp(' ');
X = [W
    Z];                      % Concateninating two matrix   
Input_Vectors = size(X,2);   % Input classes
Output_Vectors = 2;          % Output classes
Learn_Rate = 0.8;            % Learning Rate

weights = mod(randn(Output_Vectors,Input_Vectors), 1); % Initial Weight matrix
% mod(x,y) gives a output of all +ve integers

Iterations = 50;            % Number of Iterations

for iter = 1:Iterations     % For every input vector
    for N = 1:size(X,1)     % Its distance from every weight vector
        for k = 1:size(weights,1)
            D(k) = sum((X(N,:) - weights(k,:)).^2); % Euclidian Distance
        end
        if D(1)>D(2) % Finding the closest weight vector
            weights(2,:) = (weights(2,:) + (Learn_Rate*(X(N,:) - weights(2,:))));
            % Updating the current weight vector while leaving other unchanged
        else
            weights(1,:) = (weights(1,:) + (Learn_Rate*(X(N,:) - weights(1,:))));
            % Updating the current weight vector while leaving other unchanged
        end
        
        Learn_Rate = 0.9 * Learn_Rate; % To reduce the learning rate
        
    end
end

for i = 1: size(weights,1)           % Reducing the errors in weight vector
    for j = 1: size(weights,2)       % By neglecting the values less than
        if weights(i,j) <=0.1        % 0.1 which is not applicable every time
            weights(i,j) = 0;        % But in this training data we can.
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% First Method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First Method to find out which weight vector corresponds to which data set.
% Comment the down written code by uncommenting second method and you will 
% get the same result.

x = mean(W(:,:));             % Computing row mean vector of first training cluster
for N = 1:size(x,1)           % Its distance from both weight vector
    for k = 1:size(weights,1)
        D(k) = sum((x(N,:) - weights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)              % Finding the closest weight vector
        cluster1 = 'Patient'; % Comparing that mean vector with cluster output
        cluster2 = 'Control'; % If there will be changes in weight vector the
    else
        cluster1 = 'Control'; % Values assigned to output clusters will reversed
        cluster2 = 'Patient';
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Second Method %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Second Method to find out which weight vector corresponds to which.
% Uncomment the down written code by commenting first method and you will 
% get the same result.

% % Mean of Patient Weight vector is 1.25
% % Mean of Control Weight vector is 1.36
% A = round(mean(weights(1,:))*100)./100;  % Either 1.25 or 1.36 every time we calculate
% B = round(mean(weights(2,:))*100)./100;  % Either 1.36 or 1.25 every time we calculate
% if A == 1.25 || A == 1.22
%     G = weights(1,:);
%     weights(1,:) = weights(2,:);
%     weights(2,:) = G;   
% end
% cluster1 = 'control'; % Assigning cluster1 to control
% cluster2 = 'patient'; % Assigning cluster1 to patient
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Test Set

disp('Test Data for Project 3:');
disp('mohit.txt with 4 row vectors');
disp(' ');
disp('Results: ');
for N = 1:size(Y,1)     % Its distance from every weight vector
    for k = 1:size(weights,1)
        D(k) = sum((Y(N,:) - weights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)        % Finding the closest weight vector
        disp(['Test Vector ',num2str(N),' Belongs to ',cluster2]);
    else
        disp(['Test Vector ',num2str(N),' Belongs to ',cluster1]);
    end
end
     
%%%%%%%%%%%%%%%%%%%%%%%% Thank You For Your Time %%%%%%%%%%%%%%%%%%%%%%%%%%
