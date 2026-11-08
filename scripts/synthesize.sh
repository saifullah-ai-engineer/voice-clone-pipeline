#!/bin/bash
# Voice cloning synthesis wrapper - sets env fixes for Sopro
export NO_PROXY="localhost,127.0.0.1,::1"
export no_proxy="localhost,127.0.0.1,::1"
export TMPDIR=~/tmp
exec ~/workspace/chatterbox-venv/bin/soprotts "$@"
