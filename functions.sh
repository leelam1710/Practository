#!/bin/bash

sample() {
  echo Hello from the sample function
  c=100
  echo "b=$b"
}

function sample1() {
  echo Hello again from sample1 function.
  echo "first argument = $1"

}


sample
b=200
echo c=$c
sample1 fight