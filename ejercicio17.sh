#!/bin/bash

ls | tr -d 'a' | tr '[:lower:] [:upper:]' '[:upper:] [:lower:]'

#tb es posible tr '[A-Za-z]' '[a-zA-Z]'
