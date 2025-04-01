%----------------------------------------------------
% Basic Coupon Collector Problem
% (One-per-box, equal probability of each coupon)
% Code Written by: Abigail Rose Drumm
% Date: February 2025
%-----------------------------------------------------

clc; clear; close all

n = 50; % number of unique coupons
index = 1:n; % indices for coupons

%% Formula for E(tau)

summands = zeros(1,n);
summands(index) = (1./index);
exp_val = n*sum(summands);

disp(['The expected number of boxes (1 per box) before achieving a complete collection of ' num2str(n) ' is ' num2str(ceil(exp_val)) '.'])

%% Simulation

collection = []; % vector to hold collection

while length(unique(collection)) < n
    collection = [collection, randi(n,1)];
end

disp(['In one run, ' num2str(length(collection)) ' boxes were purchased before the collection was complete.'])

%% Average over runs

runs = 20;
composite = zeros(1,runs);

for r = 1:runs
    collrun = []; % vector to hold collection
    while length(unique(collrun)) < n
        collrun = [collrun, randi(n,1)];
    end
    composite(r) = length(collrun);
end

disp(['On average, over ' num2str(runs) ' runs, ' num2str(ceil(mean(composite))) ' boxes were purchased before the collection was complete.'])
