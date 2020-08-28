function [outputArg1] = SerialSend(s,com)
%SERIALSEND この関数の概要をここに記述
%   詳細説明をここに記述
% flushinput(s);
fprintf(s,com);

outputArg1='';
pause(0.04);
% 
%    while(s.BytesAvailable == 0)
%    end
   while(1)
    fprintf(s,"Q:");
%     pause(0.01);
    outputArg1= fscanf(s); % #ok<AGROW>
    if(contains(outputArg1,'R'))
        break;
    end
   end
end