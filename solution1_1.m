function [SqnrAdm1, SqnrPcm1, SqnrAdm2, SqnrPcm2]= solution1_1(s1,s2,bits)
    SqnrAdm1 = admquantizer(s1,bits);
    SqnrPcm1 = pcmquantizer(s1,bits);
    SqnrAdm2 = admquantizer(s2,bits);
    SqnrPcm2 = pcmquantizer(s2,bits);
end