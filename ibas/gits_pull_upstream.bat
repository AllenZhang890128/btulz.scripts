@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo             gits_pull_upstream.bat
echo                     by niuren.zhu
echo                           2017.05.27
echo  ˵����
echo     1. ��������Ŀ¼������.git�ļ������Ի�ȡ�������°档
echo     2. ����1������Ŀ¼��
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET STARTUP_FOLDER=%~dp0
REM ����Ĺ���Ŀ¼
SET WORK_FOLDER=%~1
REM �ж��Ƿ񴫹���Ŀ¼��û����������Ŀ¼
if "%WORK_FOLDER%"=="" SET WORK_FOLDER=%STARTUP_FOLDER%
REM ������Ŀ¼����ַ����ǡ�\������
if "%WORK_FOLDER:~-1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\

echo --������Ŀ¼��%WORK_FOLDER%
for /f %%l in ('dir /b "%WORK_FOLDER%"') DO (
  SET FOLDER=%WORK_FOLDER%%%l
  if exist !FOLDER!\.git (
    echo ----��ʼ��ȡ��!FOLDER!
    cd !FOLDER!
    git fetch upstream && git merge upstream/master
  )
)
cd %WORK_FOLDER%