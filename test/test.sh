#!/bin/sh
cat util.m4 | m4 && echo util is OK || util is NG
