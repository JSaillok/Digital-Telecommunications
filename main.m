%A ΜΕΡΟΣ - ΑΠΑΝΤΗΣΕΙΣ ΕΡΩΤΗΜΑΤΩΝ 1.1, 1.2
clc;
clear;
close all;

fprintf('\nΜΕΡΟΣ 1 - ΑΠΟΤΕΛΕΣΜΑΤΑ ΕΡΩΤΗΜΑΤΟΣ 1.1\n');
[s1,s2] = srcA(10000);
[SQNR_sound_ADM_1_2, SQNR_sound_PCM_1_2, SQNR_sound_ADM_2_2, SQNR_sound_PCM_2_2]= solution1_1(s1,s2,2);
[SQNR_sound_ADM_1_4, SQNR_sound_PCM_1_4, SQNR_sound_ADM_2_4, SQNR_sound_PCM_2_4]= solution1_1(s1,s2,4);
[SQNR_sound_ADM_1_8, SQNR_sound_PCM_1_8, SQNR_sound_ADM_2_8, SQNR_sound_PCM_2_8]= solution1_1(s1,s2,8);
fprintf('\nΜΕΡΟΣ 1 - ΑΠΟΤΕΛΕΣΜΑΤΑ ΕΡΩΤΗΜΑΤΟΣ ΜΕΡΟΣ 1.2 (Εντροπία Ήχου)\n');
[sound_entropy1]=solution1_2(s1);
[sound_entropy2]=solution1_2(s2);

fprintf('\nΜΕΡΟΣ 1 - ΑΠΟΤΕΛΕΣΜΑΤΑ ΕΡΩΤΗΜΑΤΟΣ 2.1\n');
[SQNR_photo_PCM_2, SQNR_photo_PCM_4]= solution2_1();
fprintf('\nΜΕΡΟΣ 1 - ΑΠΟΤΕΛΕΣΜΑΤΑ ΕΡΩΤΗΜΑΤΟΣ 2.2 (Εντροπία Εικόνας)\n');
[image_entropy]= solution2_2('cameraman.mat');
