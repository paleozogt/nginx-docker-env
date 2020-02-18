amd64:   ARCH = amd64
arm64v8: ARCH = arm64v8
ppc64le: ARCH = ppc64le

buildimage:
	docker build -t paleozogt/nginx:$(ARCH) --build-arg ARCH=$(ARCH) .

amd64: buildimage
arm64v8: buildimage
ppc64le: buildimage

multiarch:
	docker manifest create --amend paleozogt/nginx \
		paleozogt/nginx:amd64 \
		paleozogt/nginx:arm64v8 \
		paleozogt/nginx:ppc64le

