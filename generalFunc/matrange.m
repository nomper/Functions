function r = matrange(x, minvalue, maxvalue)
%% min < x and x < max のboolen を返却します。
if(minvalue > maxvalue)
    tempvalue = maxvalue;
    maxvalue = minvalue;
    minvalue = tempvalue;
end
r = and(minvalue < x, x < maxvalue);

end

