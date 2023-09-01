function R_loc=PT_rloc(ecg,Fs) 
% ecg: ECG signal
% Fs: Sampling frequency
% R_loc: A vector containing locations of R peaks




    ecg = ecg - mean (ecg );    % cancel DC conponents
    ecg = ecg/ max( abs(ecg )); % normalize to one
    N=length(ecg);

    % LPF (1-z^-6)^2/(1-z^-1)^2

    b=[1 0 0 0 0 0 -2 0 0 0 0 0 1];

    a=[1 -2 1];

    h_LP=filter(b,a,[1 zeros(1,12)]); % transfer function of LPF

    x2 = conv (ecg ,h_LP);

   % x2 = x2 (6+[1: N]); %cancel delay

    x2 = x2/ max( abs(x2 )); % normalize , for convenience .



    % HPF = Allpass-(Lowpass) = z^-16-[(1-z^-32)/(1-z^-1)]

    b = [-1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 -32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];
    a = [1 -1];

    h_HP=filter(b,a,[1 zeros(1,32)]); % impulse response iof HPF
    x3 = conv (x2 ,h_HP);

   % x3 = x3 (16+[1: N]); %cancel delay

    x3 = x3/ max( abs(x3 ));
    


    % Make impulse response

    h = [-1 -2 0 2 1]/8;

    % Apply filter

    x4 = conv (x3 ,h);
    x4 = x4 (2+[1: N]);
    x4 = x4/ max( abs(x4 ));

    % Take square
    x5 = x4 .^2;
    x5 = x5/ max( abs(x5 ));



    % Make impulse response
    h = ones (1 ,31)/31;
    Delay = 15; % Delay in samples

    % Apply filter
    x6 = conv (x5 ,h);
    x6 = x6 (15+[1: N]);
    x6 = x6/ max( abs(x6 ));

    % Apply threshold
    max_h = max(x6);
    thresh = mean (x6 );
    poss_reg =(x6>thresh*max_h);


    left = find(diff([0 poss_reg'])==1);
    right = find(diff([poss_reg' 0])==-1);


    left=left-(6+16);  % cancel delay because of LP and HP
    right=right-(6+16);% cancel delay because of LP and HP
    
    if left(1)-(6+16)<0
       % left=left;
       left(1)=[];
       right(1)=[];
    end
    
    if length(left)>1
     for i=1:length(left)
        [R_value(i) R_loc(i)] = max( ecg(left(i):right(i)) );
        R_loc(i) = R_loc(i)-1+left(i); % add offset
        [S_value(i) S_loc(i)] = min( ecg(left(i):right(i)) );
        S_loc(i) = S_loc(i)-1+left(i); % add offset
     end
     R_loc=R_loc(find(R_loc~=0));
     S_loc=S_loc(find(S_loc~=0));
     rrdiff=diff(R_loc);
    else 
        rrdiff=0;
    end
    
    

    if left(1)-(6+16)<0
       % left=left;
       left(1)=[];
    else
    left=left-(6+16);
    end

    R_loc=R_loc(find(R_loc~=0));
    S_loc=S_loc(find(S_loc~=0));


    

    rrdiff=diff(R_loc);
    if length(rrdiff)<1
        rrdiff=R_loc(1);
    end
    rrdiffmean=mean(rrdiff,2);
 
    %hatalı olanları bulma
    if length(rrdiff)<2
        missing_ones=count;
    else
        missing_ones=0;
    end
    
    if length(left)>1
     for l=1:length(R_loc)
      max_points_index(l)=R_loc(l)+Delay;
      max_point_amplitude(l)=x6(max_points_index(l));
     end
    else 
     max_points_index=0;
     max_point_amplitude=0;
    end
    
   
    
    
    
end