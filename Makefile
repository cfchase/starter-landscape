ENV_FILE := .env
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})

.DEFAULT_GOAL := build

.PHONY: oc-login
oc-login:
	${OC} login ${OC_URL} -u ${OC_USER} -p ${OC_PASSWORD} --insecure-skip-tls-verify=true
	${OC} project ${PROJECT} 2> /dev/null || oc new-project ${PROJECT}

.PHONY: build
build:
	./install/build.sh

.PHONY: push
push:
	./install/push.sh

.PHONY: deploy
deploy: oc-login
	./install/deploy.sh

.PHONY: rollout
rollout: oc-login
	./install/rollout.sh

.PHONY: undeploy
undeploy: oc-login
	./install/undeploy.sh

