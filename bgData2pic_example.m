%% adjustable
clear
% output_type = {'bmp','tiff','png','jpeg'};%'jpg' 'tif' alternative
output_type = {'tiff'};
map = get_OSI_rainbow();
% map = gray(130);

%% main
path = uigetdir([],'请选择.bgData所在文件夹');
file_path_s = dir([path,filesep,'**/*.bgData']);
if isempty(file_path_s),error('files dir error.');end
[~,t]=regexp(path,'.*\');
outpath = [path(1:t),'output'];pathend = size(path,2)+1;
if ~exist(outpath,"dir"),mkdir(outpath);end


calAll = [size(output_type,1)*size(output_type,2),length(file_path_s)];
waitBar=waitbar(0,'1','name','Calculating...');

for temp = 1:length(file_path_s)
    waitbar(temp/calAll(2),waitBar,sprintf('%.3g%%，%d/%d',...
        temp/calAll(2)*100,temp*calAll(1),calAll(1)*calAll(2)));

    path1 = [file_path_s(temp).folder,filesep,file_path_s(temp).name];
    [pathtemp,name,~]=fileparts(path1);
    outpathtemp = [outpath,pathtemp(pathend:end)];
    if ~exist(outpathtemp,"dir"),mkdir(outpathtemp);end

    bgData2pic(path1,[outpathtemp,filesep,name],map,output_type)
end
delete(waitBar);

function OSI_rainbow = get_OSI_rainbow()
OSI_rainbow =[
    64    64    64
    40     0    60
    50     0    70
    60     0    80
    70     0    85
    80     0    90
    95     0   100
   105     0   110
   115     0   115
   125     0   115
   140     0   115
   155     0   115
   170     0   115
   185     0   115
   200     0   125
   210     0   135
   220     0   150
   220     0   180
   205     0   200
   205     0   230
   190     0   255
   170     0   255
   150     0   255
   130     0   255
   110     0   255
    80     0   255
    40     0   255
     0     0   255
     0     0   245
     0     0   235
     0     0   225
     0     0   215
     0     0   205
     0    35   205
     0    50   205
     0    65   205
     0    80   205
     0    95   205
     0   105   210
     0   115   220
     0   125   225
     0   125   235
     0   135   240
     0   145   250
     0   155   255
     0   170   255
     0   185   255
     0   195   255
     0   210   255
     0   230   255
     0   245   255
     0   255   235
     0   255   220
     0   255   180
     0   255   140
     0   255    80
     0   255     0
     0   240     0
     0   235     0
     0   230     0
     0   225     0
     0   220     0
     0   215     0
     0   210     0
     0   205     0
     0   200     0
     0   195     0
     0   190     0
    30   195     0
    35   200     0
    40   205     0
    50   210     0
    70   215     0
    90   220     0
   118   225     0
   137   230     0
   156   234     0
   174   238     0
   191   241     0
   207   245     0
   221   248     0
   233   250     0
   242   252     0
   249   254     0
   254   255     0
   255   255     0
   255   254     0
   255   252     0
   255   249     0
   255   244     0
   255   238     0
   255   231     0
   255   223     0
   255   215     0
   255   206     0
   255   196     0
   255   187     0
   255   177     0
   255   168     0
   255   160     0
   255   152     0
   255   145     0
   255   139     0
   255   134     0
   255   131     0
   255   129     0
   255   128     0
   255   127     0
   255   125     0
   255   122     0
   255   117     0
   255   111     0
   255   104     0
   255    96     0
   255    87     0
   255    78     0
   255    69     0
   255    59     0
   255    50     0
   255    41     0
   255    32     0
   255    24     0
   255    17     0
   255    11     0
   255     6     0
   255     3     0
   255     1     0
   255     0     0
   255     0     1
   255   255   255
]/255;
end
