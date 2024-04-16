#!/usr/bin/env bash
#
# Script Name: google.sh 
# Description: Buscar la canción que está sonando en rutracker.org
# Author: volteret4
# Repository: https://github.com/volteret4/
# License: 
# TODO: 
# Notes:
#   Dependencies:
#       Firefox     Thorium-browser      chromium       xdotool
#

# Establecer Variables
deadbeef="$(deadbeef --nowplaying-tf "%artist%")"
strawberry=$(playerctl -p strawberry status)
player_active=$(playerctl -l | awk 'NR==1')
playing=$(playerctl -p "${player_active}" status)

if [[ ${strawberry} =~ 'Playing' ]]
    the
        player_active='strawberry'
    elif [[ -n ${deadbeef} ]]
        then
            artista="$(deadbeef --nowplaying-tf "%artist%")"
            cancion="$(deadbeef --nowplaying-tf "%title%")"
            album="$(deadbeef --nowplaying-tf "%album%")"
    elif [[ ${playing} =~ 'Playing' ]]
        then
            echo "player is ""${player_active}"""
        else
            player_active=$(playerctl -l | awk 'NR==2')
fi

app_actual=$(xdotool getactivewindow getwindowname)
thorium="Thorium$"
chromium="Chromium"
firefox="Mozilla Firefox"


# Obtener metadata del reproductor actual

artista=$(playerctl -p "${player_active}" metadata xesam:artist)
cancion=$(playerctl -p "${player_active}" metadata xesam:title)
album=$(playerctl -p "${player_active}" metadata xesam:album)

busqueda=$(echo "${artista} ${album}" | sed 's/&/and/g')

url="https://rutracker.org/forum/tracker.php?nm=${busqueda}"

# Abrir busqueda en rutracker


if [[ ${app_actual} =~ ${thorium} ]]
    then
        thorium-browser "${url}" &
    elif [[ ${app_actual} =~ ${firefox} ]]; then
        firefox "${url}" &
    elif [[ ${app_actual} =~ ${chromium} ]]; then
        chromium "${url}" &
    else
        echo "${busqueda}"
        qutebrowser --target window "${url}"
fi