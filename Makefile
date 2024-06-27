# Define the directories
NOTEBOOK_DIR := notebooks
SCRIPTS_DIR := src
NOTEBOOK_FILES := $(wildcard $(NOTEBOOK_DIR)/*.ipynb)

.PHONY: convert


convert:
	$(NOTEBOOK_FILES:$(NOTEBOOK_DIR)/%.ipynb=$(SCRIPTS_DIR)/%.py)
	$(SCRIPTS_DIR)/%.py: $(NOTEBOOK_DIR)/%.ipynb
		jupyter nbconvert --to script --output-dir $(SCRIPTS_DIR) $<
