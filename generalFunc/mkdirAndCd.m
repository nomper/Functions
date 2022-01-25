function oldFolder = mkdirAndCd(newFolder)
%MKDIRANDCD mkdir then change directry
%   input is folder name
[status, msg, msgID] = mkdir(newFolder);
oldFolder = cd(newFolder);

end

