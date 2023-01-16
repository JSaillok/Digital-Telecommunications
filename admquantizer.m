function [ADM]= admquantizer(s,N)
 
fprintf('\nΑποτελέσματα κβάντισης ADM %d bits\n',N);

k=ceil(N);
if k<4
   k=4;
end
 
s=interp(s,k);            
if (nargin==2)
    samples=length(s);     
    h=1;
end
if (nargin==3)
    h=1;
end
 
s=s(1:samples);
 
StepSize=1/(5*k);   
 
 
[a,cn]=adm_encoder(s, StepSize);

Sn=adm_decoder(a,cn);
Sa=filter(100, .1, Sn);
e=s'-Sa;
 
figure
subplot(4,1,1)
plot(s,'k');
title(['Σήμα Εισόδου ADM-' num2str(N)]);
 
subplot(4,1,2)
plot(Sa,'b');
title(['Σήμα Εξόδου ADM-' num2str(N)]);
 
Ps=sum(s(1:samples).^2)/samples;
Pn=sum(e(1:samples).^2)/samples;
ADM=10*log10(Ps/Pn);
fprintf('\t\tΙσχύς Σήματος(S):\t%f\n',Ps);
fprintf('\t\tΙσχύς Θορύβου(Ν):\t%f\n',Pn);
fprintf('\t\tSQNR ADM-%d:\t%f[dB]\n',N,ADM);
end
