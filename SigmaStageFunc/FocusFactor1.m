function [FF] = FocusFactor1(img)
% moveStage(s,do_init,x,y,z)
%   詳細説明をここに記述
% [FF] = FocusFactor1(img)
% [sz1 sz2 sz3]=size(img);
FF=max([reshape(abs(diff(img,1,1)),[],1);reshape(abs(diff(img,1,2)),[],1)]);