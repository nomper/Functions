function[ZPosition] = GetPosition(s)
%GETPOSITION この関数の概要をここに記述
%   詳細説明をここに記述
    ack = SerialSend(s(1), "Q:");
    str = string(ack);
    ZStatus = erase(strsplit(str, ","), " ");
    ZPosition=ZStatus(1);
end

