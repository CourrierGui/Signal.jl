% extraire.m

clear all, close all
[x,fe] = wavread('PAROLE.wav',[121800 147500]);
figure
plot(x) % c'et une des rares utilisations de plot sans pr�ciser d'abscisses
grid on, zoom on
xlabel('Num�ro de l''�chantillon')
ylabel('Valeur')
title('Extrait du signal de parole')
n1 = 13800;
n2 = 20000;
mot1 = x(1:n1);
mot2 = x(n1+1:n2);
mot3 = x(n2+1:length(x));
% Vous pouvez �couter le signal initial puis les signaux scind�s
% en utilisant la fonction sound
