%----------------------------------------------------
% Batched Coupon Collector Problem
% (b-per-box, equal probability of each coupon)
% Code Written by: Abigail Rose Drumm
% DateL February 2025
%-----------------------------------------------------

clc; clear; close all

n = 50; % number of unique coupons
index = 1:n; % indices for coupons
b = 2; % b = 1 corresponds to the classic problem

%% Formula for E(tau)
% Note: Only works up to n = 50

if n <= 50
    summands = zeros(1,n);
    nb = nchoosek(n,b);
    
    for s = 1:n
        if n-s < b
            summands(s) = (-1)^(s-1) * nchoosek(n,s);
        else
            summands(s) = (-1)^(s-1) * (nchoosek(n,s) * nb) / (nb - nchoosek(n-s,b));
        end
    end
    
    exp_val = sum(summands);
    
    disp(['The expected number of boxes (' num2str(b) ' per box) before achieving a complete collection of ' num2str(n) ' is ' num2str(ceil(exp_val)) '.'])
end

%% Simulation

collection = []; % vector to hold collection
count = []; % vector to hold count of unique coupons per iteration

while length(unique(collection)) < n
    collection = [collection, randi(n,1,b)];
    count = [count, length(unique(collection))];
end

disp(['In one run, ' num2str(length(collection)/b) ' boxes were purchased before the collection was complete.'])

%% Average over runs

runs = 20;
composite = zeros(1,runs);

for r = 1:runs
    collrun = []; % vector to hold collection
    while length(unique(collrun)) < n
        collrun = [collrun, randi(n,1,b)];
    end
    composite(r) = length(collrun);
end

disp(['On average, over ' num2str(runs) ' runs, ' num2str(ceil(mean(composite)/b)) ' boxes were purchased before the collection was complete.'])