.PHONY: install format lint test clean

install:
	pip install -e ".[dev]"
	pip install -e packages/core
	pip install -e packages/service-a
	pip install -e packages/service-b

format:
	black .
	isort .

lint:
	flake8 .
	black . --check
	isort . --check

test:
	pytest

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -exec rm -rf {} +