PYTHON=python3
PIP=pip3
VENV=.venv

all: $(VENV)/bin/activate

$(VENV)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(VENV)
	$(VENV)/bin/$(PIP) install --upgrade pip
	$(VENV)/bin/$(PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

tests_run:
	$(VENV)/bin/$(PYTHON) -m unittest discover -s tests

clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -r {} +

fclean: clean
	rm -rf $(VENV)

.PHONY: all clean fclean tests_run
