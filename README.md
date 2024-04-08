仅用此项目记录一下 Label-Studio 在 Windows pip 环境的使用记录。

我的目的是对星穹铁道的游戏截图进行标注，最后输出到YOLO训练，实现怪物、可破坏物等的目标识别。

# 环境准备

使用 `install.bat` 搭建虚拟环境并安装 label-studio 。其中使用版本为

- python = 3.11.9
- label-studio = 1.11.0

# 运行

复制 `env_sample.bat` 至 `env.bat` 并修改其中的环境变量，随后运行 `run.bat` 即可。

|环境变量|作用|
|---|---|
|LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED|设置成True后，可以导入本地图片，或将项目信息导出到本地|
|LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT|本地数据的根目录，后续用到的本地数据路径都需要是这个的子目录|
|LABEL_STUDIO_BASE_DATA_DIR|label-studio存储数据的位置，默认在 `\AppData\Local\label-studio`|

完整可用的环境变量可见 [官网](https://labelstud.io/guide/start#Command-line-arguments-for-starting-Label-Studio)

# 使用

## 1.创建账号

Label-Studio是作为一个平台对外提供服务的，可以支持多人协作，因此有一套账号体系。无特别安全要求时随意即可。

## 2.创建项目

相当于一个数据集的包装，在创建时可以输入名字，然后在 `Labeling Setup` 页签选择你需要的标注方式。我使用YOLO的情况下，选择 `Object Detection with Bounding Boxes`。

## 3.导入图片

打开项目后，右上角有 `Import` 按钮可以导入图片。

如果像我一样，图片本来就是在运行服务的机子上的话，可以按以下操作

1. 设置环境变量`LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED`和`LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT`后启动
2. 项目页面的右上角进入`Settings`->`Cloud Storage`
3. 点击`Add Source Storage`，选择`Storage Type`=`Local Files`
4. 在`Absolute local path`填入图片的路径，注意这个路径必须是 `LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT` 的子目录
5. 在`File Filter Regex`填入`.*(jpe?g|png|tiff)`
6. 勾选`Treat every bucket object as a source file` （这个看不懂为什么，不勾选就是不行）
7. 保存后，点击`Sync Storage`，就可以把本地图片都同步导入到项目中了
8. 返回项目页面可以看到导入的图片

## 4.标注

在项目页面点击图片就可以进入标注的页面

1. 点击需要标注的`label`
2. 在图片上拖拽出目标框
3. 点击`Submit`或者`Update`

## 5.导出

数据量少的时候，可以直接在页面上进行导出。

数据量大的时候，可以在运行服务的机子上使用命令行导出，命令为。

```shell
label-studio export your_project_id your_export_type --export-path=your_export_path
```

注意这里运行时环境变量需要跟你的服务一致，因为环境变量中有储存数据的目录。

你也可以复制`export_sample.bat`修改后使用，这里继承了`env.bat`的环境变量。
