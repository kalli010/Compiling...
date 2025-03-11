#!/bin/bash

CMD="make re"

$CMD > /dev/null 2>&1 & CMD_PID=$!

echo -n "Compiling"

while kill -0 $CMD_PID 2>/dev/null; do
  for i in {1..3}; do
    echo -n "."
    sleep 0.5
  done
  echo -ne "\rCompiling   \rCompiling"
done

echo -e "\rCompiling finished.    "

# define fk_left
# @if [ "$2" = "bonus" ] || [ "$2" = "all" ]; then \
# 	if make -q $1; then \
# 	    echo "$1 is up to date."; \
# 			exit 0; \
# 	fi; \
# fi; \
# bash -c ' \
# MK="make $1"; \
# LOGFILE=$$(mktemp); \
# $$MK >$$LOGFILE 2>&1 & MK_PID=$$!; \
# echo -n "Compiling $2"; \
# while kill -0 $$MK_PID 2>/dev/null; do \
#     for i in {1..3}; do \
#         echo -n "."; \
#         sleep 0.5; \
#     done; \
#     echo -ne "\rCompiling $2   \rCompiling $2"; \
# done; \
# wait $$MK_PID; \
# STATUS=$$?; \
# if [ $$STATUS -ne 0 ]; then \
#     echo -e "\r$2 failed. See the output below:"; \
#     cat $$LOGFILE; \
# else \
#     if [ "$2" = "bonus" ] || [ "$2" = "all" ]; then \
#        echo -e "\r$1 Created Successfully.   "; \
#     else \
#        echo -e "\r$2 finished.    "; \
#     fi; \
# fi; \
# rm -f $$LOGFILE; \
# '; 
# endef
