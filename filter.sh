#!/bin/bash

# using sed to filter out "(user account)"" text from Title field for 1 password import
sed  "s/ ([^)]*),/,/" $1 > $2