function [FF,BF,MF,camera_image_G] = GetFF2(s,vid,z,FigureNumber, ImageShowEnable)
% [FF,camera_image] = getFF(s,vid,z)
comm=sprintf("AGO:C%+.0f",z);
SerialSend(s,comm);
StageWait(s,vid);
flushdata(vid);
while(vid.FramesAvailable<1)
end
camera_image=getsnapshot(vid);
camera_image_G=gpuArray(camera_image);
camera_image_Gc=ycbcr2rgb(camera_image_G);

figure(FigureNumber);
if(ImageShowEnable)
    imshow((camera_image_Gc),'InitialMagnification',25);
end
FF=FocusFactor1(camera_image_G);
[B,~]=BlackDetect_hsv(camera_image_Gc);
BF=sum(B(:))/(2000^2);
[M,~]=MetalDetect_hsv(camera_image_Gc);
MF=sum(M(:))/(2000^2);
% FF3=max(max(max(abs(gradient(camimgG(:,:,1))))));
% fprintf("FF1:%.0f\n",FF)
title(num2str(FF));
StageWait(s,vid);
end