clear all
% Original filename
list=dir('..\rawdata\*.txt');
for n=1:length(list)
    filename=list(n).name;
    [filepath,name,ext] = fileparts(filename);
    
    parts = strsplit(name, '-');
    
    % Extracting initials of each part
    initials = cellfun(@(str) upper(str(1)), parts);
    let=isletter(initials);
    numbers=~isletter(initials);
    
    % Creating the new filename
    newFilename = strcat(initials(let),parts{end-1},parts{end},ext);
    
    fname=fullfile('..\rawdata\',filename);
    newfname=fullfile('..\data\',newFilename);
    
    copyfile(fname, newfname);
end