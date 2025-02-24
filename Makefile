include .env

cluster-create:
	k3d cluster create

manifest-apply:
	kubectl config use-context k3d-k3s-default
	kubectl apply -f manifest.yaml

flux-bootstrap:
	flux bootstrap github \
	--owner=$(GITHUB_USER) \
	--repository=flux-demo \
	--branch=main \
	--path=./clusters/k3s-default \
	--personal
