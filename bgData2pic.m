function [] = bgData2pic(pathbgData,pathOutput,map,output_ext)
% bgData2pic  Read data from .bgData file and save to .ext picture file.
%   bgData2pic(pathbgData,pathOutput,map,output_ext)
%   example:
%       bgData2pic(pathbgData,pathOutput,map,{'bmp','tiff','png','jpeg'})
%
%   output_type = {'bmp','tiff','png','jpeg'},'jpg' 'tif' alternative
%
% Syntax: (这里添加函数的调用格式, `[]`的内容表示可选参数)
%	[] = bgDataRead(pathbgData, pathOutput, map ...
%							[, output_ext, "tiff"]);
%
% Params:
%   - pathbgData    [required]  [char] 处理.bgData路径
%   - pathOutput    [required]  [char] 输出图片路径
%   - map    [required]  [numeric; size=130,3] 输出图片颜色图，要求130×3\n对应3对应\t\t[R,\tG,\tB]\n130对应\t\t[<0;\t128位;\t过曝]
%   - output_ext    [required]  [] 输出图片种类，可多选，多选请用cellstr，例：\nbgData2pic('bmp')\nbgData2pic('tiff')\nbgData2pic('png')\nbgData2pic('jpeg')\nbgData2pic({'bmp','tiff'})
%
% Matlab Version: R2023b
%
% Author: oyy
%
[I,~] = bgDataRead(pathbgData);
Iout_ind = uint8(ceil(I*128));

if any(strcmp(output_ext,'bmp'))
    imwrite(Iout_ind,map,[pathOutput,'.bmp'],"bmp");
end

if any(strcmp(output_ext,'tiff')|strcmp(output_ext,'tif'))
    [~,bg] = bgDataRead(pathbgData);
    t = Tiff([pathOutput,'.tiff'],'w');
    setTag(t,"Photometric",Tiff.Photometric.RGB)
    setTag(t,"ImageLength",bg.numrows)
    setTag(t,"ImageWidth",bg.numcols)
    setTag(t,"RowsPerStrip",bg.numrows)
    setTag(t,"BitsPerSample",8)
    setTag(t,"Compression",Tiff.Compression.LZW)
    setTag(t,"SampleFormat",Tiff.SampleFormat.UInt)
    setTag(t,"ResolutionUnit",Tiff.ResolutionUnit.Centimeter)
    setTag(t,"XResolution",1e4/bg.pixelscalexum)
    setTag(t,"YResolution",1e4/bg.pixelscaleyum)
    setTag(t,"SamplesPerPixel",4)
    setTag(t,"PlanarConfiguration",Tiff.PlanarConfiguration.Chunky)
    setTag(t,"ExtraSamples",Tiff.ExtraSamples.Unspecified)
    setTag(t,"Orientation",Tiff.Orientation.TopLeft)
    alpha = 255*ones([bg.numrows bg.numcols],"uint8");
    Iout_color = ind2rgb(Iout_ind,uint8(map*255));
    write(t,cat(3,Iout_color,alpha))
    close(t)
end

if any(strcmp(output_ext,'png'))
    imwrite(Iout_ind,map,[pathOutput,'.png'],"png");
end

if any(strcmp(output_ext,'jpeg')|strcmp(output_ext,'jpg'))
    imwrite(Iout_ind,map,[pathOutput,'.jpg'],"jpg");
end
end
