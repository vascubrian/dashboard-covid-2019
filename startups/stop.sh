# Simply kill the running instance of the server
[ -z $1 ] && echo 'Environment not specified' && exit 1
ENV=$1
CUSTOMER=$2
echo "Killing the running instances of the wekebere"
kill -9 `cat /home/$CUSTOMER/covid-2019/$ENV/pid.out > /home/$CUSTOMER/covid-2019/$ENV/logs/covid-2019.log 2>&1`
rm /home/$CUSTOMER/covid-2019/$ENV/pid.out > /home/$CUSTOMER/covid-2019/$ENV/logs/covid-2019.log 2>&1