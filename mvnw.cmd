@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script (Windows)
@REM ----------------------------------------------------------------------------
@IF "%__MVNW_ARG0_NAME__%"=="" (SET __MVNW_ARG0_NAME__=%~nx0)
@SET @@MVNW_LAUNCHER=%~dp0.mvn\wrapper\maven-wrapper.jar
@SET JAVA_HOME_CANDIDATE=%JAVA_HOME%

@IF NOT "%JAVA_HOME_CANDIDATE%"=="" GOTO init

:findJavaFromPath
FOR %%i IN (java.exe) DO SET JAVA_EXEC=%%~$PATH:i
IF NOT "%JAVA_EXEC%"=="" GOTO run_java

:init
SET JAVA_EXEC=%JAVA_HOME_CANDIDATE%\bin\java.exe

:run_java
"%JAVA_EXEC%" -classpath "%@@MVNW_LAUNCHER%" org.apache.maven.wrapper.MavenWrapperMain %*
