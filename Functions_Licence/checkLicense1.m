function islicensed = checkLicense1()

url = "https://raw.githubusercontent.com/nomper/ramdomforests_trainningSiO2/master/launchflag";
fh = @webread;
memoizedFcn = memoize(fh);
license = memoizedFcn(url);
islicensed = strfind(license, 'true');

if(isempty(islicensed)) % no license
    islicensed = false;
    f = msgbox('The License is expired','License Problem');
    exit
else
    islicensed = true;
end
