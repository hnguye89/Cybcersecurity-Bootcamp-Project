#!/bin/bash
case $3 in
 "Blackjack" )
  cat Normalised_Dealer_Schedule | sed 's/:00:00,//g' | grep $1 | grep $2 | awk -F , '{print $3}';;
  "Roulette" ) 
  cat Normalised_Dealer_Schedule | sed 's/:00:00,//g' | grep $1 | grep $2 | awk -F , '{print $4}';;
  "Texas" )
  cat Normalised_Dealer_Schedule | sed 's/:00:00,//g' | grep $1 | grep $2 | awk -F , '{print $5}';;
esac

