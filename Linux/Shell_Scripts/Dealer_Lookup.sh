# Dealer_Lookup.sh
 
cat Normalised_Dealer_Schedule | grep $1 | grep $2 | grep $3 | awk -F , '{print $1, $2, $3, $5}'

