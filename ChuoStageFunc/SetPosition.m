function res = SetPosition(s, x, y, z)
%SetPosition Set Position manually
%   詳細説明をここに記述
res = SerialSend(s, sprintf("R:A%dB%dC%d",x,y,z));
end