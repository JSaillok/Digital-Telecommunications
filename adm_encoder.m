%adm_encoder
function [StepSizeArray,cn]=adm_encoder(x, StepSize)
samples = length(x);
accum(1) = 0;
StepSizeArray(1)=StepSize; 
StepSizeArray(2)=StepSize;
for i=1:samples
    if(x(i)>=accum(i))
        output(i)=1;
            if i>1
        if output(i)==output(i-1)
            StepSizeArray(i)=1.5*StepSizeArray(i-1);
        else
            StepSizeArray(i)=(1.5^-1)*StepSizeArray(i-1);
        end
            end
        accum(i+1) = accum(i) + output(i) * StepSizeArray(i);
    else
        output(i)=-1;
            if i>1
        if output(i)==output(i-1)
            StepSizeArray(i)=1.5*StepSizeArray(i-1);
        else
            StepSizeArray(i)=(1.5^-1)*StepSizeArray(i-1);
        end
            end
        accum(i+1) = accum(i) + output(i) * StepSizeArray(i);
    end  
end
cn = output;
end
