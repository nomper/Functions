function res = SetPosOrig(s)
%SetPosition Set Position manually
%   詳細説明をここに記述
    res = SerialSend(s, sprintf("R:A%dB%dC%d", 0, 0, 0));
end