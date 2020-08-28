function [an] = moveStage(s,~,x,y,z,vid)


% comm=sprintf("AGO:A%+.0fB%+.0fC%+.0f",x,y,z);
% an=SerialSend(s,comm)
move_absolutely(s, x, y, z);
StageWait(s, vid);
% while(true)
% %     Rep=SerialSend(s,'Q:0');
%     Rep=SerialSend(s,'Q:2');
%     if(sum(Rep=='K')>3)
%         break
%     end
% end

end

