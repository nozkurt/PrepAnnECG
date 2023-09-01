function ecg_p=amplify(ecg,arg)

%The custom function should be given as a function
%Output is processed ecg signal 
%First input the function is always ecg signal
%Other arguments are the elements of arg vector
c=arg(1);
b=arg(2);

ecg_p=c*ecg+b;
