#!/bin/bash

echo "=== Garmin-Hyrox Git Push ==="

git add .

echo
read -p "Message du commit : " message

if [ -z "$message" ]; then
    message="Update"
fi

git commit -m "$message"

if [ $? -ne 0 ]; then
    echo "Erreur lors du commit."
    exit 1
fi

git push

if [ $? -eq 0 ]; then
    echo
    echo "✓ Projet envoyé sur GitHub."
else
    echo
    echo "✗ Erreur lors du push."
    exit 1
fi
