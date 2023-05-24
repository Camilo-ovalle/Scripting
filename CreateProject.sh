#!/bin/bash

# Asking the user if he wants to start a new project using viteJS
read -p "Do you want to start a new project using viteJS 🚀? (y/n): " vite

if [ $vite = "y" ]
then
    npm create vite@latest

else
    # Asking the user the name of the new project
read -p "Enter Project Name 🐉: " projectName

# Creating the folder for the new project
mkdir $projectName

cd $projectName

# Asking the user if he wants to start a new git repository
read -p "Do you want to start a git repository ? (y/n): " git

if [ $git = "y" ]
then
    read -p "Add the remote repository url 🌐: " remoteUrl
    git init

    git branch -M main

    git remote add origin $remoteUrl

    read -p "Do you want to use SSH to autenticate 🔒? (y/n): " SSH

    if [ $SSH = "y" ]
    then
        read -p "Enter the SSH link 🔗: " SSHKey
        git remote set-url origin $SSHKey
    fi
fi

# Asking the user if he wants to start a new npm project
read -p "Do you want to start a npm proyect 📦 ? (y/n): " npm

if [ $npm = "y" ]
then
    read -p "Do you want to use the default npm configuration 😎? (y/n): " npmDefault
    if [ $npmDefault = "y" ]
    then
        npm init -y
    else
        npm init
    fi
fi
mkdir src
cd src
touch index.html

cat > index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>$projectName</title>
    <link rel="stylesheet" href="styles/style.css">
    </head>
<body>
    <h1>$projectName</h1>

    <p>Start coding!</p>
    <script src="main.js"></script>
</body>
</html>
EOF

touch main.js

mkdir styles
cd styles
touch style.css

cd ..
cd ..

touch .gitignore

cat > .gitignore << EOF
node_modules
.DS_Store
EOF

echo "Now you can go to your new project directory, happy coding 🚀"
fi



