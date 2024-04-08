REM 环境变量增加 用于指定 label-studio.exe 的位置 这里指向的是本地的.env\venv\Scripts
set PATH=%PATH%;%~dp0.env\venv\Scripts

REM 应用数据保存的位置 默认在 \AppData\Local\label-studio 这里指向的是本地的.env\label-studio
set LABEL_STUDIO_BASE_DATA_DIR=%~dp0.env\label-studio

REM 启动后可读取本地文件
set LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
set LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=your_data_path
