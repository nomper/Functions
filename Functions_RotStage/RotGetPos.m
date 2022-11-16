function [r3] = RotGetPos(sr)
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述
flushinput(sr);
r1 = query(sr,"Q:");
r2 = split(r1,",");
r3 = str2double(r2(1));
end

