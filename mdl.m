%initializiing variable k as the index of output signal
k=1; 
%PAM modulation
for i=1:number
    %finds the int m that represents the symbol according to the symbols matrix
    for j=1:M
        if (sum(input(i,:)==symbol(j,:))==log2(M)) 
            m=j;
        end
    end
    %calculation of the transmitted series cos(t) 
    for t=0:T_symbol-1
      %waveforms M-PAM  
      signal(k)=(2*m-1-M)*A*g*cos(2*pi*fc*t);
      k=k+1;
    end
end