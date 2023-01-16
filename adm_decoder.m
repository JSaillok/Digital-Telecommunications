%adm_decoder
function [Sn]=adm_decoder(StepSizeArray, cn)
samples = length(cn);
samples = length(cn)
output(1) = 0;
for i=1:samples
   if(cn(i)==1)
      output(i+1) = output(i) + StepSizeArray(i);
  elseif (cn(i)==-1)
      output(i+1) = output(i) - StepSizeArray(i);
   end
end

Sn=output(2:samples+1);
end
