#!/usr/bin/env python

from distutils.core import setup
from ragelpyext.distutils import RagelExtension, build_ragel_ext

setup(name='RagelPyExt',
      version='0.0.1',
      author='Ben Mather',
      author_email='bwhmather@bwhmather.com',
      url='https://github.com/bwhmather/ragel-py-ext/',
      ext_modules=[
      ],
      cmdclass={'build_ext': build_ragel_ext},
      packages=['ragelpyext'])
