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

function email_varification()
{
	emailpattern="^[0-9a-zA-Z]+([._+-][0-9a-zA-Z]+)*@[0-9a-zA-Z]+\.[0-9a-zA-Z]{2,4}$"
	if [[ $email =~ $emailpattern ]]
	then
		echo "valid email"
	else
		echo "invalid email"
	fi
}
read -p "enter your email: " email
email_varification $email

function ValMobileNumber(){
        local CC=$1
        local Num=$2
        CodePat="^[0-9+]{3}$"
        NumPat="^[0-9]{10}$"
        if [[ $CC =~ $CodePat && $Num =~ $NumPat ]]
        then
                echo "valid mobile number"
        else
                echo "invalid mobile number"
        fi
}
read -p "enter mob number with country code: " Code Number;
mob_num="$( ValMobileNumber $Code $Number )"

function passwordVal(){
        local pw=$1
        passPattern1="^([A-Za-z0-9@#!]){8,}$"
	passPattern2="^([a-z0-9@#!]*)[A-Z]+([a-z0-9@#!]*)$"
	passPattern3="^[a-zA-Z0-9]*[0-9]+[a-z0-9A-Z@#!]*$"
	passPattern4="^([a-zA-Z0-9]*)[^a-zA-Z_0-9\ ]([a-zA-Z0-9]*)$"
        if [[ $pw =~ $passPattern1 ]]
        then
		if [[ $pw =~ $passPattern2 ]]
		then

			if [[ $pw =~ $passPattern3 ]]
        	        then
				if [[ $pw =~ $passPattern4 ]]
				then
					echo "valid password"
				else
       		 	        	echo "invalid password"
	        		fi
			else
				echo "error: enter at least 1 number"
			fi
		else
			echo "error: enter at least one special character"
		fi
	else
		echo "error: length should be at least 8 characters"
	fi
}
read -p "enter password: " password;
pswd="$( passwordVal $password )"
