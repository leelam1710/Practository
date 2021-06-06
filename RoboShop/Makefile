help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

Common:
	@sh Components/Common.sh

Cart: Common
Cart:			## Install Cart
	@sh Components/Cart.sh

Catalogue: Common
Catalogue:		## Install Catalogue
	@sh Components/Catalogue.sh

frontend: Common
frontend:		## Install frontend
	@sh Components/frontend.sh

mongodb: Common
mongodb:		## Install mongodb
	@sh Components/mongodb.sh

redis: Common
redis:			## Install redis
	@sh Components/redis.sh

user: Common
user:			## Install user
	@sh Components/user.sh

mysql: Common
mysql:			## Install mysql
	@sh Components/mysql.sh

shipping: Common
shipping:			## Install Shipping Component
	@sh Components/shipping.sh

rabbitmq: Common
rabbitmq:			## Install rabbitmq Component
	@sh Components/rabbitmq.sh

payment: Common
payment:			## Install Payment Component
	@sh Components/payment.sh
