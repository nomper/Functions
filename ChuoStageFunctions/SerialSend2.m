function [response] = SerialSend2(s, command)
%SERIALSEND この関数の概要をここに記述
%   詳細説明をここに記述

response = query(s, command);