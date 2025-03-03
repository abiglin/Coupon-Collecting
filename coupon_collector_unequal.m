%----------------------------------------------------
% Coupon Collector Problem with Unequal Prob
% (One-per-box, unequal probabilities)
%-----------------------------------------------------
% Code Written by: Abigail Rose Drumm
% Date: February 2025
%-----------------------------------------------------

clc; clear; close all

n = 5; % number of unique coupons
index = 1:n; % indices for coupons

p = rand(1,n); % randomly generate numbers for probabilities
p = p/sum(p); % normalize p so that the components add to 1
pEdges = cumsum([0 p]); % cumulative probability vector
pEdges(end) = 1;

x = rand(1, 1e5); % randomly generate numbers from the probability distribution
v = discretize(x, pEdges, index);

figure()
% create a histogram representing the probability distribution
histogram(v, 'BinEdges', [sort(index) n+1]-0.05, 'Normalization', 'probability')
yline(p, ':')

%% Simulation

collection = []; % vector to hold collection

while length(unique(collection)) < n
    coin = rand(1);
    collection = [collection, min(find(pEdges > coin))-1];
end

disp(['In one run, ' num2str(length(collection)) ' boxes were purchased before the collection was complete.'])

%% Average over runs

runs = 20;
composite = zeros(1,runs);

for r = 1:runs
    collrun = []; % vector to hold collection
    while length(unique(collrun)) < n
        coin = rand(1);
        collrun = [collrun, min(find(pEdges > coin))-1];
    end
    composite(r) = length(collrun);
end

disp(['On average, over ' num2str(runs) ' runs, ' num2str(ceil(mean(composite))) ' boxes were purchased before the collection was complete.'])