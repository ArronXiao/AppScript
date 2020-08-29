@echo off
:: 推荐阅读关于/f的使用 https://blog.csdn.net/razor87/article/details/8252998

set pathName="targetconfigpath"

:: 字符串比较的时候，需要用%来引用比较，不然无法取到值

for /f "eol=# tokens=1,2 delims==" %%i in (target.config) do (
  if "%%i"==%pathName% set targetConfigPath=%%j
 )
 
echo targetConfigPath is %targetConfigPath%
 
set Key_debugMainActivity="debugMainActivity"

for /f "eol=# tokens=1,2 delims==" %%i in (%targetConfigPath%) do (
  if "%%i"==%Key_debugMainActivity% set value_debugMainActivity=%%j
)
echo start mainActivity is %value_debugMainActivity%
adb shell am start -D -n %value_debugMainActivity%