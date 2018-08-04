% A day is divided into 24 timeintervals. Patient takes dosage at 7AM,
% 10AM, 1 PM, 5PM and 7 PM (Corresponding Time labels are 7, 10, 13, 17,
% 19]

% Blood glucose level for a patient is generated with the help of normal
% distribution. We created a sample of size 90 (for 90 days) for each time period
% by taking mean and variance as follows
%   Timelabel    mean(m)    Variance(Var)
%       7         200          213
%       10        180          13.90
%       13        200          43.73
%       17        210          59.40
%       19        198          63.65

 BG = var.*randn(90,1) + m;
 
% Carb Input for a patient is also generated with the help of normal
% distribution. We created a sample of size 90 (for 90 days) for each time period
% by taking mean and variance as follows
%   Timelabel    mean(m)   Variance(Var)
%       7        40           25.95
%       10       25           10.47
%       13       40            6.76
%       17       25           16.86
%       19       38           12.78

 Carb_input = var.*randn(90,1) + m;
 
% Target High and Low Blood glucose levels, Carb Ratio, Insulin Sensitivity
% are specific to a patient. In our data we assumed Target High, 
% Target Low Blood glucose levels, Carb Ratio and Insulin Sensitivity for 
% the patient as 140, 100, 0.1 and 50 respectively.

% We couldn't model Active Insulin for the patient as it depends on the
% circidian rythm of the patient. However, it is an additive term which
% doesn't affect the performance of the Training algorithm. Hence, it was
% ignored.

% Finally, Bolus Dosage is estimated using the formula in the paper.