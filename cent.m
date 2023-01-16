function [ sk,lu ] = cent( mint,mfin,sig,k,levels )
lu=0;
sk=0;
for j=1:10000
    if(sig(j)<mfin && sig(j)>=mint)
        lu=lu+1;
        sk=sk+sig(j);
    end
end
if lu==0
    sk=(mint+mfin)/2;
    lu=1;
end
end