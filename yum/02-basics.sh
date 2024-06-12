#!/bin/bash

yum -y install setup
yum -y groupinstall "Development Tools"

yum -y upgrade
