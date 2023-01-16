%%Lloyd-Max
function [xq, kentra, delta] = Lloyd_Max(X, N, min_value, max_value)
count=0;
for q=1:N %%no. of bits
  q_levels = 2^N;
    
    minv = min_value; 
    maxv = max_value;
   
    len=(-1*minv+maxv)/q_levels;
    m=zeros(1,q_levels+1);
    for i=1:q_levels+1
        m(i)=minv+(i-1)*len;
    end 
    sig=X;
    sig=sort(sig);
    lu=zeros(1,q_levels);
    sk=zeros(1,q_levels);
    
    for i=2:1000
        for k=1:q_levels
            [sk(k),lu(k)]=cent(m(k),m(k+1),sig,k,q_levels);
            kentra(k)=sk(k)/lu(k);
        end
        
        for k=2:q_levels
            m(k)=(kentra(k-1)+kentra(k))/2;
        end
        
        for h=1:q_levels
            for t=1:1:length(X)
                if(X(t)<m(h+1) && X(t)>=m(h))
                    xq(t)=kentra(h);
                end
            end
        end  
        
        e=10^(-6); 
        
        a=X-xq'; 
        b=a.^2;
        mse1(i)=sum(b)/length(X);
       
        if (abs(mse1(i)-mse1(i-1))<e) 
            delta = mse1(i-1);
            break;
        end
        delta=mse1(i);        
    end
end
end
