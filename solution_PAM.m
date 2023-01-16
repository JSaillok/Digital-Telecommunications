clear;
init();
% #symbols as bits 1st 4-PAM and 2nd 8-PAM 
% so 1st smbl=2 and next smbl=3bits
smbl=2;
while (smbl<4)
% depending on the value of the symbol the code for the M-PAM 
% will be configured i. e. either 4-PAM configuration or 8-PAM
% respectively
M=2^smbl;
eb=1/log2(M);
% initialization SNR=1 and as it changes the corresponding
% BER and SER values of the signal will be recorded
SNR_i=1;
% produced bits
Lb=10000*log2(M); 
xbits=randsrc(Lb,1,[0 1]);   
input=reshape(xbits,Lb/log2(M),log2(M));
output=input*0;
ybits=xbits*0;
number=Lb/log2(M);
% output signal
signal=zeros(Lb/log2(M)*40,1);
% produced Gray symbols for each PAM configuration
g_symbols();
% For each SNR we perform modulation and demodulation
% and measure the noise values and calculate the BER, SER 
for snr=0:2:20  
    mdl();
% calculation of the noise level and addition of noise to s
    No=eb/(10^(snr/10));
    noise = sqrt(No/2)*randn(number*40,1);
    r=noise+signal; 
    demdl();
% calculation BER, SNR for each SNR
ybits=output(:);
    BER(1,SNR_i)=sum(abs(ybits-xbits))/Lb;
    SER(1,SNR_i)=sum(abs(bi2de(output)-bi2de(input)))/number;
% increase SNR value for repetition having different SNR value
    SNR_i=SNR_i+1;
end
% BER / Symbοl Error Rate (SER) Graph
   figure(1)   
   SNR=0:2:20;
   %4-PAM magenta
   if (M==4)
       semilogy(SNR,BER,'m');
       hold on
   else
       %8-PAM blue
       semilogy(SNR,BER,'b');
   end     
       xlabel('SNR (db)');
       ylabel('BER');
       %annotation('4-PAM','8-PAM');
        
   figure(2)
   SNR=0:2:20;
   %4-PAM magenta
   if (M==4)
      semilogy(SNR,SER,'m');
      hold on
   else
       %8-PAM blue
      semilogy(SNR,SER,'b');
   end
          xlabel('SNR (db)');
          ylabel('SER'); 
    smbl = smbl + 1;
end