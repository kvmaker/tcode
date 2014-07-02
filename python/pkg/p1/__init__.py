import os
import importlib

for f in os.listdir(__path__[0]):
    if f.endswith(".py") and f != "__init__.py":
        importlib.import_module(__name__ + "." + f[:-3])
