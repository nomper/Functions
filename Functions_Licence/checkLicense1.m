function islicensed = checkLicense1()
url = "https://raw.githubusercontent.com/nomper/ramdomforests_trainningSiO2/master/launchflag";
fh = @webread;
memoizedFcn = memoize(fh);
license = memoizedFcn(url);
license_str = string(license);
islicensed1 = contains(license, 'true');
islicensed2 = eval(license);

if(islicensed1) % no license
    islicensed = true;
else
    if(islicensed2)
        islicensed = true;
    else
        islicensed = false;
        exit
    end
end
