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

echo Ajout des fichiers au commit...
git add .
git commit -m "%COMMIT_MESSAGE%"

echo Envoi des modifications sur GitHub...
git push -u origin %BRANCH_NAME%

echo Mise à jour terminée.
pause