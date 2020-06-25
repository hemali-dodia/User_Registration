#!/bin/bash -x

echo "welcome"

shopt -s extglob

function valFirstLastName(){
        local Name=$1
	F_L_Pattern="^[A-Z]{1}[a-z]{2,}$"
        if [[ $Name =~ $F_L_Pattern ]]
        then
                echo "Accepted"
        else
                echo "Invalid Name, 1st char should be cap, min 3 char required"
        fi
}

read -p "enter first name and last name:" First_name Last_name;

valFirstLastName $First_name
valFirstLastName $Last_name
