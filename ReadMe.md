# compileOrDebug
apktool.jar 反编译apk，二次打包的过程是一个很常见的过程，在不同的环境下每次都需要我重新来一次，很烦人。
就写了个用于配置的批处理来处理这些麻烦的事，以后只用调用以X开头的脚本就好了

target.config里面指向targconfig文件夹里面的具体配置，因为的不同的应用的配置肯定是不同的，可能需要有调试多个应用的需求，targe.config里面配置了哪个就使用哪个。
- XDecompileApk.cmd 用来反编译APk
- XRepackAndSign.cmd 用来二次打包

以下的三个脚本是用来使用IDApro需要使用的
- XConnectDebug.cmd
- XReforward.cmd
- XStartDebugMainActivity.cmd

# oat2dex 
系统的应用经过了预编译，也是恶心的过程，我只想一键转换。待写