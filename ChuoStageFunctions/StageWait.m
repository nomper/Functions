function StageWait(s)
%StageWait Waiting for mov.
%   詳細説明をここに記述
while(true)
    Rep = SerialSend(s,'Q:2');
    if(sum(Rep=='K') > 3)
        break
    end
end
end