function SetWavelength(obj1, wavelength)
%INITPM100USB この関数の概要をここに記述
%   詳細説明をここに記述
write(obj1, sprintf("CORR:WAVE %d",wavelength));


end

