@echo off
setlocal

:: 定义注册表路径
set "reg_path=HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS"
set "reg_key=Enable Double Pinyin"

:: 获取当前的双拼设置
for /f "tokens=5" %%A in ('reg query "%reg_path%" /v "%reg_key%"') do set "current_value=%%A"

:: 切换双拼和全拼
if "%current_value%"=="0x1" (
    echo 当前是双拼模式，切换到全拼模式...
    reg add "%reg_path%" /v "%reg_key%" /t REG_DWORD /d 0 /f 1>NUL 2>NUL
) else (
    echo 当前是全拼模式，切换到双拼模式...
    reg add "%reg_path%" /v "%reg_key%" /t REG_DWORD /d 1 /f 1>NUL 2>NUL
)

:: 提示切换成功
echo 切换成功。

endlocal
REM pause
