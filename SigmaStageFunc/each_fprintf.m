function [outputArg1] = each_fprintf(s,comm)
    %EACH_FCLOSEF この関数の概要をここに記述
    %   詳細説明をここに記述
outputArg1 = '';

for i = 1:2
    SerialSend(s(i), comm);
end

end

