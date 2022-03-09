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