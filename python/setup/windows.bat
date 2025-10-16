@echo off
echo Creating AWS .env file for Windows...

REM Check if AWS CLI is available
aws --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: AWS CLI not found. Please install AWS CLI first.
    pause
    exit /b 1
)

REM Get AWS credentials from AWS CLI
for /f "delims=" %%i in ('aws configure get aws_access_key_id 2^>nul') do set AWS_ACCESS_KEY_ID=%%i
for /f "delims=" %%i in ('aws configure get aws_secret_access_key 2^>nul') do set AWS_SECRET_ACCESS_KEY=%%i
for /f "delims=" %%i in ('aws configure get region 2^>nul') do set AWS_DEFAULT_REGION=%%i

REM Check if credentials were found
if "%AWS_ACCESS_KEY_ID%"=="" (
    echo ERROR: No AWS credentials found. Run 'aws configure' first.
    pause
    exit /b 1
)

REM Set default region if not configured
if "%AWS_DEFAULT_REGION%"=="" set AWS_DEFAULT_REGION=us-east-1

REM Create .env file
echo AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID% > .env
echo AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY% >> .env
if not "%AWS_SESSION_TOKEN%"=="" echo AWS_SESSION_TOKEN=%AWS_SESSION_TOKEN% >> .env
echo AWS_DEFAULT_REGION=%AWS_DEFAULT_REGION% >> .env

echo Done! .env file created with AWS credentials.
echo Check .env file for your credentials.
pause