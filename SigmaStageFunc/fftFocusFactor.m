function [highFP] = fftFocusFactor(img)
img = rgb2gray(img);
img=imresize(img, [256 256]);
[row, col]=size(img);
imgFFT=fftshift(fft2(img));
fLog = log(1+abs(imgFFT));

Pyy = imgFFT.*conj(imgFFT)/251;
f = 1000/251*(0:127);
% 
% [pk, MaxFraq] = findpeaks(Pyy, 'Npeaks', 1, 'Sortstr', 'descend');

[M, I]=max(Pyy(1:128));
% Pyy;
% M;
% I;
% Psum=sum(sum(Pyy));
% peakPow=sum(Pyy(I-10:I+10));
% Pper=peakPow/Psum*10^10;
highFP = sum(Pyy(100:127));

% colormap(gray);
% subplot(2,2,1), imagesc(img); title('Original image')
% subplot(2,2,2), imagesc(fLog); title('Fourier Image')
% subplot(2,2,[3,4]), plot(f, Pyy(1:128)); title('Power spectral density')
