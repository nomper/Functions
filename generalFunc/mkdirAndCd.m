function oldFolder = mkdirAndCd(newFolder)
%MKDIRANDCD mkdir then change directry
%   input is folder name
mkdir(newFolder);
oldFolder = cd(newFolder);

end

