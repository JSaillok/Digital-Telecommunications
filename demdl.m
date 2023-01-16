%demodulation PAM
k=1;
for i=1:number
    %Calculation of symbol with demodulation function
    for t=0:T_symbol-1
    rr(t+1)=r(k)*g*cos(2*pi*fc*t);
    k=k+1;
    end
    r_symbol=sum(rr);
    for m=1:M
    sv=(2*m-1-M)*A;
    %symbol distance
    d(m)=sqrt(sum((r_symbol-sv).^2));
    end
    %demaper by pronunciation for symbol output
    [mnm l]=min(d);
    output(i,:)=symbol(l,:);
end
