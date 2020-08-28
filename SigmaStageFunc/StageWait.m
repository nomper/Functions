function [outputArg1] = StageWait(s,vid)
%StageWait Waiting for mov.
%   詳細説明をここに記述
while(true)
    rep1 = SerialSend(s(1), 'Q:');
    rep2 = SerialSend(s(2), 'Q:');
    if(vid.FramesAvailable>100)
        flushdata(vid);
    end
    
    if(count(rep1, 'K') + count(rep2, 'K')  >= 3)
        break
    end
end
end