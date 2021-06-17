cat Normalised_Dealer_Schedule | sed 's/:00:00,//g' | grep $1 | grep $2 | awk -F , '{print $4}'
