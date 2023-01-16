function [s1 ,s2] = srcA(L)

x = randn(L,1);
s1 = filter(1,[1, -0.9],x);
s2 = filter(1,[1, -0.01],x);