function [x, y, z] = GetPosition(s)
%GETPOSITION シリアルを渡すと三軸の現在位置を返す
%   シリアルを渡すと三軸の現在位置を返す
x=str2double(SerialSend(s,'Q:A1'));
y=str2double(SerialSend(s,'Q:B1'));
z=str2double(SerialSend(s,'Q:C1'));
end

