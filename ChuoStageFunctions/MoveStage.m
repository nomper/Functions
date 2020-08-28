function response = MoveStage(s, x, y, z)
% moveStage(s,do_init,x,y,z)
%   詳細説明をここに記述

command = sprintf("AGO:A%+.0fB%+.0fC%+.0f", x, y, z);
response = SerialSend(s, command);

end

