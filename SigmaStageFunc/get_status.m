function [status] = get_status(s)
%GET_STATUS
%   詳細説明をここに記述
while(s(1).BytesAvailable)
    fscanf(s(1));
end

while(s(2).BytesAvailable)
    fscanf(s(2));
end

status = "";
for i = 1:2
    ack=SerialSend(s(i), "Q:");
    status = status + ack;
end
end

