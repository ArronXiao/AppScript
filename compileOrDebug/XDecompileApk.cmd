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

echo value_apktoolJarPath is %value_apktoolJarPath%
echo value_decompilerOUtDir is %value_decompilerOUtDir%
echo value_originalApkPath is %value_originalApkPath%

echo start decompiler operate
java -jar %value_apktoolJarPath% d -f -o %value_decompilerOUtDir% %value_originalApkPath%
echo end decompiler operate