%LPF lowpass filter
function Sa=LPF(tap, cf, Sn)
b=fir1(tap,cf);
Sa = conv2(Sn,b,'same');
end
