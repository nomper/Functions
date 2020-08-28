function [FF,camera_image] = GetFF(s,vid,z,FigureNumber, ImageShowEnable)
% [FF,camera_image] = getFF(s,vid,z)
comm=sprintf("A:W+P%+.0f",z);
SerialSend(s(2),comm);
SerialSend(s(2), "G:");
StageWait(s,vid); 
get_status(s);
flushdata(vid);
c=0;
while(vid.FramesAvailable<1)
    c=c+1;
    if(c>100)
        if(~isrunning(vid))
            flushdata(vid);
            start(vid);
        end
        c=0;
    end
end
camera_image=getsnapshot(vid);
camera_image_G= gpuArray(camera_image);
% camera_image_Gc=ycbcr2rgb(camera_image_G);

figure(FigureNumber);
if(ImageShowEnable)
    imshow(ycbcr2rgb(camera_image_G),'InitialMagnification',25);
end
FF=FocusFactor1(camera_image_G);
% FF3=max(max(max(abs(gradient(camimgG(:,:,1))))));
% fprintf("FF1:%.0f\n",FF)
title(num2str(FF));
StageWait(s,vid);
end