# Define the directories
APPLICATION_NAME := spark-app
NOTEBOOK_DIR := notebooks
SCRIPTS_DIR := src
NOTEBOOK_FILES := $(wildcard $(NOTEBOOK_DIR)/*.ipynb)

convert:
	$(NOTEBOOK_FILES:$(NOTEBOOK_DIR)/%.ipynb=$(SCRIPTS_DIR)/%.py)
	$(SCRIPTS_DIR)/%.py: $(NOTEBOOK_DIR)/%.ipynb
		jupyter nbconvert --to script --output-dir $(SCRIPTS_DIR) $<

docker:
	docker build -t $(APPLICATION_NAME) .
	docker run $(APPLICATION_NAME)

docker-dev:
	docker build -t $(APPLICATION_NAME)-dev . -f Dockerfile.dev
	docker run $(APPLICATION_NAME)
