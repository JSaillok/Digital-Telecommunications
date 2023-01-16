function [SQNR_2, SQNR_4]=pcmquantizer2()

i=load('cameraman.mat');
i=cell2mat(struct2cell(i));
x=i(:);
x=(x-128)/128;
 
figure
subplot(3,1,1);
imshow(uint8(i))
title('ΧΩΡΙΣ PCM');
 
    
[xq centers D]=Lloyd_Max(x,2,min(x),max(x));
 
 xnew=xq*128+128;
 i_after=reshape(xnew,256,256);
 subplot(3,1,2);
 imshow(uint8(i_after));
 title('2-PCM');
 SQNR_2 = 10*log10(mean(x.^2)/mean((x-xq').^2));
 fprintf('PCM-SQNR(db) [%d bits quantization]= %f\n',2,SQNR_2);
    
 [xq centers D]=Lloyd_Max(x,4,min(x),max(x));
 
 xnew=xq*128+128;
 i_after=reshape(xnew,256,256);
 subplot(3,1,3);
 imshow(uint8(i_after));
 title('4-PCM');
 SQNR_4 = 10*log10(mean(x.^2)/mean((x-xq').^2));
 
 fprintf('PCM-SQNR(db) [%d bits quantization]= %f\n',4,SQNR_4);
 
end
