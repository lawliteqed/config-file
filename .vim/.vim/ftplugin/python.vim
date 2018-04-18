python << EOF
import os
import sys

path = os.path.expanduser("~/.pyenv/versions/3.6.1/lib/python3.6/site-packages/")
if not path in sys.path:
    sys.path.append(path)
EOF
