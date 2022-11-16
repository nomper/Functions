function RotWait(sr, t)
%ROTWAIT この関数の概要をここに記述
%   詳細説明をここに記述
if(~exist("t","var"))
    t = 0.5;
elseif(t<0)
    t = -t;
end

while(true)
        flushinput(sr)
        stat = query(sr, "!:");
        if(contains(stat,"R"))
            break;
        end
        pause(t);
end
end

