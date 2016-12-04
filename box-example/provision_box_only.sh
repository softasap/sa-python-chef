#!/bin/sh

CHEF_CLIENT=`which chef-client`
export CHEF_DRIVER=ssh
chef-client -z -o main::run_provision
