#!/bin/bash

# <xbar.title>iTerm SSH Dropdown Menu</xbar.title>
# <xbar.version>v1.0</xbar.version>
# <xbar.author>Gerd Naschenweng</xbar.author>
# <xbar.author.github>magicdude4eva</xbar.author.github>
# <xbar.desc>Provides a simple menu of ssh hosts when clicked on opens a new ssh session in terminal</xbar.desc>
# <xbar.image>https://github-production-user-asset-6210df.s3.amazonaws.com/5545555/240065062-ea64630f-7545-49b1-93de-f917c7e88976.png</xbar.image>
# <xbar.dependencies></xbar.dependencies>

SSHFILE="$HOME/.ssh/config"

echo "ssh | color=#ff0000"
echo "---"
echo "My Servers"
# Измените format-строку, чтобы сделать server_type отдельным параметром
echo "--  | bash='$0' param1=ssh param2=root@ param3=ehb terminal=false"
echo "--  | bash='$0' param1=ssh param2=root@ param3=hestia terminal=false"

echo "---"
echo "All Servers"
awk '/^Host / && !/(\*)/ {print "--" $2" | bash='$0' param1=ssh param2="$2" terminal=false"}' $SSHFILE

echo "---"

if [ "$1" = 'ssh' ]; then
  # Отладочный вывод
  echo "DEBUG: Params: $1 $2 $3" >> /tmp/iterm_ssh_debug.log
  
  # Правильно получаем параметры
  SERVER="$2"
  SERVER_TYPE="$3"
  
  echo "DEBUG: Server = $SERVER, Type = $SERVER_TYPE" >> /tmp/iterm_ssh_debug.log
  
  # Установка пароля в зависимости от сервера
  if [ "$SERVER_TYPE" = "" ]; then
    PASSWORD=""  # Замените на ваш пароль
  elif [ "$SERVER_TYPE" = "" ]; then
    PASSWORD=""  # Замените на ваш пароль
  else
    PASSWORD=""
  fi
  
  # Подготовка команды
  if [ -n "$PASSWORD" ]; then
    SSH_CMD="sshpass -p '${PASSWORD}' ssh ${SERVER}"
  else
    SSH_CMD="ssh ${SERVER}"
  fi
  
  echo "DEBUG: Command = $SSH_CMD" >> /tmp/iterm_ssh_debug.log
  
  if [ "$(osascript -e 'application "iTerm" is running')" = "false" ]; then
    # Запускаем iTerm
    osascript <<EOF
    tell application "iTerm"
      create window with default profile
      tell current session of current window
        write text "${SSH_CMD}"
      end tell
      activate
    end tell
EOF
  else
    # iTerm уже запущен
    osascript <<EOF
    tell application "iTerm"
      tell current window
        create tab with default profile
        tell current session
          write text "${SSH_CMD}"
        end tell
      end tell
      activate
    end tell
EOF
  fi
  
  exit
fi
