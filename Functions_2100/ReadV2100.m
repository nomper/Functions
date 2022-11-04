function V = ReadV2100(obj, N)
%ReadV2100 keithly 2100 6 1/2から電圧を読みます
%   詳細説明をここに記述
if(exist("N","var"))
    Vt = zeros(1,N);
    for n = 1:N
        Vt(t) = str2double(query(obj, 'MEASure:VOLTage:DC?'));
    end
    V = mean(Vt);
else
    V = str2double(query(obj, 'MEASure:VOLTage:DC?'));
end

end