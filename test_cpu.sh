#!/bin/bash

function usage {
	    cat <<EOS
$(basename ${0}) is a cpu stress test tool for multi-core processor.
Usage:
    $(basename ${0}) [<options>]
Options:
    -n    using n cores in stress test. default is `grep processor /proc/cpuinfo | wc -l`.
    EOS
}

CPU_THREADS=`grep processor /proc/cpuinfo | wc -l`

while getopts n:h OPT
do
  case $OPT in
    "n" ) CPU_THREADS="$OPTARG"
          ;;
    "h" ) usage;
          exit 0
          ;;
  esac
done

echo "using "$CPU_THREADS" cores in stress test."
openssl speed -multi $CPU_THREADS > /dev/null 2>&1

