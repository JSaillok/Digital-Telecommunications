function [PCM]=pcmquantizer(x1,N)
 
fprintf('\nΑποτελέσματα κβάντισης PCM %d bits\n',N);
 
if (nargin==2)
    k=1;
end
        
N=ceil(N);

if nargin==2
    samples=length(x1)
end
 
 
lx1=samples;
 
min_value = min(x1);
max_value = max(x1);
 
    out=[];
        [xq, centers, MSE] = Lloyd_Max(x1, N, min_value, max_value);
       for i=1:1:lx1 
              out(i)=xq(i);
        end
       out=out(:);
  lo = length(out);
  
rec_out = out;                          
rec_out=rec_out-mean(rec_out);                 
lxq=length(xq);
nxq=0:lxq-1;
e=x1-xq(1:lx1);                         
ne=0:length(e)-1;
 
 
 if(N==2 || N==4 || N==8 )
     
    subplot(4,1,3)
    plot(x1,'k');
    title(['Σήμα Εισόδου PCM-' num2str(N)]);
    
 
    subplot(4,1,4)
    plot(xq,'r')
     title(['Σήμα Εξόδου PCM-' num2str(N)]);
     tmpstr=['PCM_',num2str(N)];
 end
 
 
    Ps = mean(x1.^2);
    Pn = mean((x1-out).^2);
    PCM = 10*log10(Ps./Pn);
    
fprintf('\t\tΙσχύς Σήματος(S):\t%f\n',Ps);
fprintf('\t\tΙσχύς Θορύβου(N):\t%f\n',Pn);
fprintf('\t\tSQNR PCM-%d:\t%f[dB]\n',N,PCM);
end
