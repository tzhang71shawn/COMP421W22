#!/bin/bash

db2 -t -v < cleartbl.sql 2>&1 | tee droptbl.log
