#!/bin/bash

timeout_in_sec=600 # Adjust the timeout duration as needed

elapsed_time=0

until [ $elapsed_time -ge $timeout_in_sec ];
do
  if [ "$(adb devices | grep emulator)" ]; then
    echo "Emulator is ready!"
    exit 0
  fi

  sleep 5
  ((elapsed_time+=5))
done

sleep 180

echo "Timed out waiting for the emulator to start"
exit 1
