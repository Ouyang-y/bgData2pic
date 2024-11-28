clear
mfilePath = mfilename("fullpath");
addpath([mfilePath(1:end-length(mfilename)),'\resource'])
%% adjustable
load("OSI_rainbow.mat")
map = OSI_rainbow;
% map = gray(130);
ttime = 1;

%% main
[fileName,bgDataPath] = uigetfile('.bgData','请选择需要输出.gif的.bgData文件（可多选）','MultiSelect','on');
if isempty(fileName),error('未选择文件！');end
if ~iscell(fileName),fileName=cellstr(fileName);end

outputPath = [fileparts(bgDataPath),'\output'];
pathend = size(bgDataPath,2)+1;  % 文件夹层次结构
if ~exist(outputPath,"dir"),mkdir(outputPath);end

calAll = length(fileName);
waitBar=waitbar(0,'1','name','Calculating...');
warning("off",'MATLAB:imagesci:writegif:dataOutOfRange')
for temp = 1:length(fileName)
    waitbar(temp/calAll,waitBar,sprintf('%.3g%%，%d/%d',...
        temp/calAll*100,temp,calAll));
    
    path1 = [bgDataPath,fileName{temp}];
    [pathtemp,name,~]=fileparts(path1);

    info = h5info(path1,'/BG_DATA');
    l=size(info.Groups,1);
    if l==1
        warning('%s仅单张图片，进行默认.tif输出\n',path1);
        bgData2pic(path1,[outputPath,name],map,'tif')
    else
        pertime = ttime/l;
        for templ = 1:l
            [I,~] = bgDataRead(path1,"GroupName",templ);
            if templ == 1
                imwrite(uint8(ceil(I*130)),map,[outputPath,name,'.gif'],"gif","LoopCount",Inf,"DelayTime",pertime);
            else
                imwrite(uint8(ceil(I*130)),map,[outputPath,name,'.gif'],"gif","WriteMode","append","DelayTime",pertime);
            end
        end
    end
end
warning("on",'MATLAB:imagesci:writegif:dataOutOfRange')
delete(waitBar);
