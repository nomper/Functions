function [outputArg1] = SetToCenter(s, vid)
%SETTOCENTER この関数の概要をここに記述
%   詳細説明をここに記述
SerialSend(s(1), "H:W++" );
StageWait(s, vid);
% SerialSend(s(2), "A:1+P0");
for i=1:5
    pause(1);
    flushdata(vid);
end
SerialSend(s(1), "M:W-P30000-P30000");
SerialSend(s(2), "A:1+P0");
pause(1)
% StageWait(s, vid);

SerialSend(s(1), "G");
SerialSend(s(2), "G:");

for i=1:5
    pause(1);
    flushdata(vid);
end
% StageWait(s, vid);
SerialSend(s(1), "R:W");
% SerialSend(s(2), "R:1");

outputArg1 = " ";
end



