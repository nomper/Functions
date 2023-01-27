function StageWait(s,t)
%StageWait Waiting for mov.
%   詳細説明をここに記述
timer = tic;
if(~exist("t","var"))
    t = 2;
end
while(true)
    Rep = SerialSend(s,'Q:2');
    if(isempty(Rep))
        continue;
    
    end

    if(count(Rep,"K") > 3)
        break
    end
    if(toc(timer)>t)
        toc
        break;
    end
end
clear timer
end