function RotSet(sr, deg)
%ROTSET この関数の概要をここに記述
%   詳細説明をここに記述
pulse = ceil(400*deg);
fprintf(sr, sprintf("A:1+P%d", pulse));
fprintf(sr, sprintf("G:"));
% RotWait(sr, 0.5)
end

