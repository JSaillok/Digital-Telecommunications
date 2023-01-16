function [H_image] = solution2_2(image)           
             i=load (image);
             i=cell2mat(struct2cell(i));
             photo=i(:);
             photo=(photo-128)/128;
             H_image=0;
             count=1;
      while(2^count<=4)
             
      [xq, centers, D]=Lloyd_Max(photo,2^count,min(photo),max(photo));            
                     for j=1:2^(2^count)
                             POS=sum((xq==centers(j)))/length(photo); 
                                if (POS~=0)
                                       H_image= H_image +(-POS*log2(POS));
                                end
                     end
      fprintf('Source-B[%d bits quantization] = %f \t\n',2^count,H_image);           
      count=count+1;

      end
end
