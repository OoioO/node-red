IMAGE=mojocrypt/node-red
TAG=latest

build:
	docker build --rm=true -t $(IMAGE):$(TAG) .

push: build
	docker push $(IMAGE):$(TAG)

run: build
	docker run --name node-red --rm -p 1880:1880 $(IMAGE):$(TAG)

#deploy: push
#	helm upgrade --install test-server ./chart/test-server --namespace test --create-namespace --set image.tag=$(TAG)#
# docker build --rm=true --tag=node-red .
# docker run -it -p 1880:1880 --name mynodered node-red 
# docker run -it -p 1880:1880 -v ~/data:/root/.node-red --name mynodered node-red