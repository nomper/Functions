function move_absolutely(s,x,y,z)
%MOVE_ABSOLUTELY この関数の概要をここに記述
%1軸は絶対移動があるが2軸側にはないのでここで絶対移動を実装する。
%s(1)には2軸、a(2)には1軸のポートがはいっている。

%2軸の位置情報抽出
flushinput(s(1));
flushinput(s(2));
ack = SerialSend(s(1), "Q:");
str = string(ack);
two_axis_position = erase(strsplit(str, ","), " ");
x = x - str2double(two_axis_position(1));
y = y - str2double(two_axis_position(2));


%2軸書き込み
if x>=0 && y>=0
    str2 = sprintf("M:W+P%.0f+P%.0f", [abs(x), abs(y)]);
elseif x>=0 && y<=0
    str2 = sprintf("M:W+P%.0f-P%.0f", [abs(x), abs(y)]);
elseif x<=0 && y<=0
    str2 = sprintf("M:W-P%.0f-P%.0f", [abs(x), abs(y)]);
elseif x<=0 && y>=0
    str2 = sprintf("M:W-P%.0f+P%.0f", [abs(x), abs(y)]);
end
SerialSend(s(1), str2);

str1 = sprintf("A:W+P%.0f", z);

%1軸書き込み
SerialSend(s(2), str1);
% fscanf(s(2))
%1軸実行
SerialSend(s(2), "G:");
fscanf(s(2));
%2軸実行
SerialSend(s(1), "G");
SerialSend(s(1), "Q:");
fscanf(s(1));
flushinput(s(1));
flushinput(s(2));
end

