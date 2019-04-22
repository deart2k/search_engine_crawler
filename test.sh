#!/bin/bash

pip install -r requirements-test.txt
python3 -m unittest discover -s tests/
coverage run -m unittest discover -s tests/ 
coverage report --include crawler/crawler.py
