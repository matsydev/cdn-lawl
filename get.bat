@echo off
set REPO_URL=https://github.com/matsydev/cdn-lawl.git
set BRANCH_NAME=main

for /f "tokens=1-4 delims=/ " %%a in ("%date% %time%") do (
    set CURRENT_DATE=%%a-%%b-%%c
    set CURRENT_TIME=%%d
)

git pull origin main

echo Dossier mis à jour prêt à être update
pause