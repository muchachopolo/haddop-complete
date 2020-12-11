#!/bin/bash
mkdir /TelegramUpdates
while true; do
  wget -O ./TelegramUpdates/updates https://api.telegram.org/bot1498998529:AAG7I6cAZr1e7Zsd5e-EQES7QfwfvLnn_Vg/getUpdates
  sleep 5;
done