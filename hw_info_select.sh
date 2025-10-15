#!/bin/bash

GlobVar="Welcome."

function al {
    local this_var="+++Hardware Selector+++"
    echo "$this_var"
}

    al
    echo "$GlobVar"

function bert {
    local this_var_too=$(lspci)
    echo "$this_var_too"
}

    echo -e "These are my devices:\n" 
sleep 3

    bert
    echo -e "\n"
    echo "Please choose which device to display info."
    echo "Type first 7 characters of any device line"

read chosen_device

function einstein {
    local dev_output=$(lspci -s $chosen_device)
    echo "$dev_output"
}

    einstein
    echo -e "\n"
    echo "Would you like to see the info from this device in more detail?"
    echo "Type Yes or No"

read dev_detail

case $dev_detail in
    [yY]|[yY][eE][sS])
    echo "OK! Here it is!"
    ;;
    [nN]|[nN][oO])
    echo "OK! No more details available. Good-Bye!"
    exit 0
esac

sleep 3

function used_his_functions_wisely {
    local dev_output_detailed=$(lspci -s $chosen_device -v)
    echo "$dev_output_detailed"
}

    used_his_functions_wisely

function end_message {
    local finish="---SySteM aNaLYsis TerMiNateD !---"
    echo -e "\n"
    echo $finish
}

    end_message
