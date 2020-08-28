function [x_limit, y_limit] = go_2ax_limit(s, x, y, z)

d= 1000;

ack=get_status(s);
str = string(ack);
two_axis_position = erase(strsplit(str, ","), " ");

x_limit=x;
y_limit=y;
while two_axis_position(4) ~="L"
    x_limit = x_limit + d;
    move_absolutely(s, x_limit, y, z);
    ack = SerialSend(s(1), "Q:");
    str = string(ack);
    two_axis_position = erase(strsplit(str, ","), " ");
end

end

