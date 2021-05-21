#!/bin/bash

sample() {
  echo Hello from the sample function
  c=100
  echo "b=$b"
}

function sample1() {
  return
  echo Hello again from sample1 function.
  echo "first argument = $1"

}

b=200
sample
echo c=$c
sample1 fight