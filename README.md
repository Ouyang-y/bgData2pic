# bgData2pic
convert .bgData to picture, {'bmp','tiff','png','jpeg','jpg','tif'} alternative
## 文件结构
``` matlab
bgData2pic
│  bgDataRead.m  % .bgData读取函数
│  bgData2pic.m  % .bgData转换函数
│  bgData2gif.m  % 单个多帧.bgData文件生成gif
│  bgData2pic_example.m  % 文件夹转换
│  functionSignatures.json  % 自定义代码建议和自动填充
│  背景动.bgData  % 单个多帧.bgData文件样例
│  过曝.bgData  % 测试colormap样例
│
└─example  % 测试文件夹层次样例
    │  1-1-1.bgData
    │  1-1-2.bgData
    │  1-1-3.bgData
    │
    ├─1
    │      1-1-5.bgData
    │
    ├─3
    │      1-1-10.bgData
    │
    └─8
            1-2-5.bgData
            1-2-6.bgData
            1-2-7.bgData
```
## 更新说明