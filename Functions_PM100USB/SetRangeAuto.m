function SetRangeAuto(obj1, isAuto)
%SetRangeAuto この関数の概要をここに記述
%   詳細説明をここに記述
if(isAuto)
    write(obj1, "CORR:WAVE ON");
else
    write(obj1, "CORR:WAVE OFF");
end

end

