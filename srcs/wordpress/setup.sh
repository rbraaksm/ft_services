cd /www

APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

wp db create
wp core install --url=${URL}:5050 --title=wordpress --admin_user=rene --admin_password=password --admin_email=rbraaksm@student.codam.nl --skip-email
wp user create test1 test1@student.codam.nl --user_pass=test1 --role=author
wp user create test2 test2@student.codam.nl --user_pass=test2 --role=author
wp user create test3 test3@student.codam.nl --user_pass=test3 --role=author

php-fpm7
nginx

while true; do
	sleep 5
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1 ]; then break
	fi
done
