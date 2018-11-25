#!/bin/bash

set -e
set -i
set -x

export JAVA_HOME=${JAVA_HOME:-"/usr/java"}
export JAVACMD=${JAVA_HOME}/bin/java
export EXE_COMMAND=${EXE_COMMAND:-"echo Hello"}

#### ------------------------------------------------------------------------
#### ---- Extra line added in the script to run all command line arguments
#### ---- To keep the docker process staying alive if needed.
#### ------------------------------------------------------------------------
if [ $# -lt 1 ]; then
    echo "Starting docker process daemon ..."
    #### ------------------------------------------------------------------------
    #### ---- You need to set PRODUCT_EXE as the full-path executable binary ----
    #### ------------------------------------------------------------------------
    sudo -E /bin/bash -c "(JAVA_HOME=${JAVA_HOME:-/usr/java}; JAVACMD=${JAVA_HOME}/bin/java; ${EXE_COMMAND:-echo Hello})"
    exec "/bin/bash";
else
    exec "$@";
fi
