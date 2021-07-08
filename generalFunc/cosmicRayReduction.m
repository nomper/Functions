function spe2 = cosmicRayReduction(spe, th, type)
if(nargin < 1)
    return;
elseif(nargin < 2)
    th = 1.5;
    type = "mean";
elseif(nargin < 3)
    type = "mean";
end
type = string(type);
range = abs(spe-mean(spe)) < th*std(spe);
s1 = sum(range(:));
s2 = sum(sum(ones(size(spe))));
spe2 = spe;
if (s1 == s2)
    
else
    nrange = ~range;
    if(type == "mean")
        spe2(nrange) = mean(spe2(:));
    elseif(type == "nan")
        spe2(nrange) = nan;
    end
end
end