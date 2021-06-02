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
redis:		## Install redis
	@sh: Components/redis.sh