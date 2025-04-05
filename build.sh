#!/bin/bash

echo "Building React App..."

cd build  # Change into the build directory
npm install  # Install dependencies
npm start
cd backend
npm install
npm start
echo "React App Build Completed!"
