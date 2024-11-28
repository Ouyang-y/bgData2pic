# bgData2pic
convert .bgData to picture, {'bmp','tiff','png','jpeg','jpg','tif'} alternative
## 文件结构
``` matlab
bgData2pic
│
│  bgData2gif.m  % 多帧.bgData文件生成gif
│  bgData2pic_example.m  % 文件夹转换
│
├─resource
│      bgDataRead.m  % .bgData读取函数
│      bgData2pic.m  % .bgData转换函数
│      functionSignatures.json  % 自定义代码建议和自动填充
│      OSI_rainbow.mat  % OSI_rainbow colormap
└─test
    │  背景动.bgData  % 单个多帧.bgData文件样例
    │  过曝.bgData  % 测试colormap过曝样例
    └─example  % 测试文件夹层次样例
        │  1-1-1.bgData
        │  1-1-2.bgData
        │  1-1-3.bgData
        ├─1
        │      1-1-5.bgData
        ├─3
        │      1-1-10.bgData
        └─8
                1-2-5.bgData
                1-2-6.bgData
                1-2-7.bgData
```
## 更新说明
### V0.2
- 文件结构维护
- 函数`bgData2pic.m`
    + 加入`Llimit`以及`maxpower`提供BeamGage Z轴刻度可调
    + 修复图片引索值放大系数(修复过曝
- 函数`bgDataRead.m`
    + 修复输入总变量大小判断
- 更新自定义代码建议和自动填充
- 主程序`bgData2pic_example.m`
    + 加入`Llimit`
    + 调整路径变量名，避免使用`path`
    + 加入`addpath`
