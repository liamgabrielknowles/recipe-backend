#! /usr/bin/env bash

pkill swift
cd .build/release
./recipe-backend
cd -
