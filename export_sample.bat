@echo off
setlocal enabledelayedexpansion
chcp 65001

call env.bat

REM 按需更改成你的项目ID 导出类型 和 导出目录
label-studio export your_project_id your_export_type --export-path=your_export_path

pause