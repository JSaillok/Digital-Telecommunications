function [H] = solution1_2(s)
	H=0;
	count=1;
	while(2^count<=8)
        signal = s;
        [xq, centers, D]=Lloyd_Max(signal,2^count,min(signal),max(signal));
        for j=1:2^(2^count)
            POS=sum((xq==centers(j)))/length(signal); 
            if (POS~=0)
                H= H +(-POS*log2(POS));
            end
        end
        fprintf('Source-A [%d bits quantization] = %f \t\n',2^count,H);
        count=count+1;
	end

