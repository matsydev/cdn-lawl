@echo off
set REPO_URL=https://github.com/matsydev/cdn-lawl.git
set BRANCH_NAME=main

for /f "tokens=1-4 delims=/ " %%a in ("%date% %time%") do (
    set CURRENT_DATE=%%a-%%b-%%c
    set CURRENT_TIME=%%d
)
set COMMIT_MESSAGE=Update: %CURRENT_DATE% %CURRENT_TIME%

if not exist ".git" (
    echo Initialisation du dépôt Git...
    git init
    git remote add origin %REPO_URL%
    git branch -M %BRANCH_NAME%
)

echo Récupération des nouveautés depuis GitHub...
git fetch origin %BRANCH_NAME%

echo Fusion des dernières modifications...
git merge origin/%BRANCH_NAME%

echo Mise à jour terminée.
pause
