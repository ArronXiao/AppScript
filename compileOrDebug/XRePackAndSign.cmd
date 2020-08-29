@echo off
:: 推荐阅读关于/f的使用 https://blog.csdn.net/razor87/article/details/8252998

set pathName="targetconfigpath"

:: 字符串比较的时候，需要用%来引用比较，不然无法取到值

for /f "eol=# tokens=1,2 delims==" %%i in (target.config) do (
  if "%%i"==%pathName% set targetConfigPath=%%j
 )
 
echo targetConfigPath is %targetConfigPath%
 
set Key_apktoolJarPath="apktoolJarPath"
set key_decompilerOutDir="decompilerOutDir"
set key_v2SignBatPath="v2SignBatPath"
set key_signKeyStoreFilePath="signKeyStoreFilePath"
set key_outputApkFilePath="outputApkFilePath"
set key_signKeyStoreAlis="signKeyStoreAlis"
set key_originalApkPath="originalApkPath"

for /f "eol=# tokens=1,2 delims==" %%i in (%targetConfigPath%) do (
  if "%%i"==%key_decompilerOutDir% set value_decompilerOUtDir=%%j
  if "%%i"==%Key_apktoolJarPath% set value_apktoolJarPath=%%j
  if "%%i"==%key_v2SignBatPath% set value_v2SignBatPath=%%j
  if "%%i"==%key_signKeyStoreFilePath% set value_signKeyStoreFilePath=%%j
  if "%%i"==%key_outputApkFilePath% set value_outputApkFilePath=%%j
  if "%%i"==%key_signKeyStoreAlis% set value_signKeyStoreAlis=%%j
  if "%%i"==%key_originalApkPath% set value_originalApkPath=%%j
 )

::调用重新打包的函数 
:: call .\repackcmd.cmd %value_apktoolJarPath% %value_decompilerOUtDir%
:: call .\repackcmd.cmd %value_apktoolJarPath% %value_decompilerOUtDir%

set generate_apk_dir=%value_decompilerOUtDir%\dist

echo generate_apk_dir is %generate_apk_dir%

for /F %%i in ('Dir %generate_apk_dir% /B /A:-D') do (
	echo %%i|findstr ".apk" >nul
    if %errorlevel% equ 0 (
	echo "%%i is target apk file"
	set generate_apk_file_path=%generate_apk_dir%\%%i
	) else (
	echo not ok
	)
)
echo generate_apk_file_path is %generate_apk_file_path%

:: 调用重新签名的函数
call .\v2sign.cmd %value_v2SignBatPath% %value_signKeyStoreFilePath% %value_signKeyStoreAlis% %value_outputApkFilePath% %generate_apk_file_path%

