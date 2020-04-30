% utiliser_extraction.m

clear all, close all

[x,fe] = wavread('PAROLE.wav',[121800 147500]);
indice = 20000;
[sig1,sig2] = extraction(x,indice);