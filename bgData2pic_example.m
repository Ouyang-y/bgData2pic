clear
mfilePath = mfilename("fullpath");
addpath([mfilePath(1:end-length(mfilename)),'\resource'])
%% adjustable
% output_type = {'bmp','tiff','png','jpeg'};%'jpg' 'tif' alternative
output_type = {'tiff'};
% Limit = 0;
load("OSI_rainbow.mat")
map = OSI_rainbow;
% map = gray(130);

%% main
bgDataPath = uigetdir([],'请选择.bgData所在文件夹');
file_path_s = dir([bgDataPath,filesep,'**/*.bgData']);
if isempty(file_path_s),error('files dir error, no .bgData exist.');end

outputPath = [fileparts(bgDataPath),'\output'];
pathend = size(bgDataPath,2)+1;  % 文件夹层次结构
if ~exist(outputPath,"dir"),mkdir(outputPath);end

calAll = [size(output_type,1)*size(output_type,2),length(file_path_s)];
waitBar=waitbar(0,'1','name','Printing Figures...');

for temp = 1:length(file_path_s)
    waitbar(temp/calAll(2),waitBar,sprintf('%.3g%%，%d/%d',...
        temp/calAll(2)*100,temp*calAll(1),calAll(1)*calAll(2)));

    path1 = fullfile(file_path_s(temp).folder,file_path_s(temp).name);
    [pathtemp,name,~]=fileparts(path1);
    outpathtemp = [outputPath,pathtemp(pathend:end)];
    if ~exist(outpathtemp,"dir"),mkdir(outpathtemp);end

    if exist(Llimit,"var")
        bgData2pic(path1,[outpathtemp,filesep,name],map,output_type,"Llimit",Llimit)
    else
        bgData2pic(path1,[outpathtemp,filesep,name],map,output_type)
    end
end
delete(waitBar);
