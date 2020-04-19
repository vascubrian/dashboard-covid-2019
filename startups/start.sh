[ -z $1 ] && echo 'Environment not specified' && exit 1
ENV=$1
CUSTOMER=$2
declare -A ports
ports=( ["dev"]="8087" ["prod"]="8088")
# Exiting the service in case it's already running
/bin/bash /home/$CUSTOMER/covid-2019/startups/stop.sh $ENV $CUSTOMER
# export ENV variables
/bin/bash /home/$CUSTOMER/covid-2019/startups/exports.sh
# Running the application on the host
npm start > /home/$CUSTOMER/covid-2019/$ENV/logs/covid-2019.log 2>&1
# Print what you've just executed (for debugging)
echo "Executing:"
echo "npm start > /home/$CUSTOMER/covid-2019/$ENV/logs/covid-2019.log 2>&1"
echo $! >> /home/$CUSTOMER/covid-2019/$ENV/pid.out
echo "wekebere ${ENV} ${CUSTOMER} Instance is Up and Running"