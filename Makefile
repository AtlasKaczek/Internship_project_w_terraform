NAME = -t

default: build

build:
	echo "building image $(NAME)..."
	docker build -t $(NAME) .

push:
	echo "pushing image $(NAME)..."
	docker push $(NAME)

run:
	echo "running image $(NAME) as $(NAME)-container..."
	docker run -it --rm -d -p 8081:80 --name $(NAME)-container $(NAME)

release: build push

tinit:
	echo "Initializing terraform module..."
	cd module; terraform Init

tplan:
	echo "Planning execution of $(NAME)..."
	cd module; terraform plan -var=docker_img="$(NAME)"

tapply:
	echo "Applying $(NAME)..."
	cd module; terraform apply -auto-approve -var=docker_img="$(NAME)"

tdestroy:
	echo "Destroying $(NAME)..."
	cd module; terraform destroy -auto-approve -var=docker_img="$(NAME)"

ttest:
	echo "Testing terraform module..."
	cd tests; go test