#!/bin/bash
>django.log
exec >  >(tee -a django.log)
exec 2> >(tee -a django.log >&2)

# Remove the old checkout.
rm -rf django/
rm -rf env/

# Setup a virtualenv to install package requirements.
virtualenv --python=python2.7 --clear env
source env/bin/activate

git clone https://github.com/django/django
cd django/tests

# Install testing requirements.
pip install -r requirements/py2.txt

# Run tests.
PYTHONPATH=..:$PYTHONPATH ./runtests.py

# Get ourselves out of this environment.
deactivate