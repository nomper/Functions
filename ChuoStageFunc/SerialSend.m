function [response] = SerialSend(s, command)
%SERIALSEND serial comm.
%   中央精機は終端に\rが必ず返ってくる。
flushinput(s);
if(s.Status == "closed")
    fopen(s);
end
fprintf(s, command);
response = '';
pause(5/100);
while(s.BytesAvailable)
    response = [response fscanf(s)]; %#ok<AGROW>
    if(contains(response, '\r'))
        break;
    end
    pause(5/100);
end
end