#!/bin/bash

rm -rf django/
git clone https://github.com/django/django
cd django/tests
# Install testing requirements
sudo pip install -r requirements/py2.txt
# Run tests.
PYTHONPATH=..:$PYTHONPATH ./runtests.py