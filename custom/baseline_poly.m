function ecg_corr=baseline_poly(ecg,arg)

%The custom function should be given as a function
%Output is processed ecg signal 
%First input the function is always ecg signal
%Other arguments are the elements of arg vector
polynomial_order=2; arg(1);

% Fit the polynomial to the baseline
baseline_poly = polyfit(1:length(ecg), ecg, polynomial_order);
baseline_estimated = polyval(baseline_poly,1:length(ecg));

% Subtract the estimated baseline from the original signal
ecg_corr = ecg - baseline_estimated';






