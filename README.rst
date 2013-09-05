Ragel Python Extension Helpers
==============================

A utility library providing the basics needed to write c extensions for python generated using the ragel parser compiler.

It provides:

* Distutils integration
* Ragel boilerplate for stack management and reading from unicode strings
* A number of Ragel machines for parsing common primatives to python objects.

Due to the dependency on Ragel and a working c compiler it is recommended that portable modules provide a straight python fallback.


Installation
------------

RagelPyExt will eventually be available in PyPI.
To install use::
    pip install ragel-py-ext

or add ``"ragel-py-ext"`` to ``"setup_requires"`` in your ``setup.py`` file.

Usage
-----

An example ``setup.py`` script::

    #!/usr/bin/env python

    from distutils.core import setup
    from ragelpyext.distutils import RagelExtension, build_ragel_ext

    setup(name='ExampleExtensionModule',
          version='0.0.1',
          author='John Smith',
          author_email='john.smith@example.com',
          packages=['jsonconfigparser'],
          ext_modules=[RagelExtension('example', ['ragel.rl', 'normal.c'])],
          cmdclass={'build_ext': build_ragel_ext},
    )

``build_ragel_ext`` works the same as ``build_ext`` but passes files with the ``.rl``
extension through ragel first to create a c file with the same name, but with
the extension replaced.

``RagelExtension`` adds ``ragel_include_dirs`` and ``ragel_extra_args`` to the
paramaters accepted by ``Extension``.


Utilities
---------

A number of usefull ragel machines are bundled.
These provide support for parsing:

* c, and python strings (single and tripple quoted)
* floating point and integer numbers
* ``#``, ``//`` and ``/* */`` comments
* whitespace
* json
* python style sets, dictionaries and arrays

Parsers for simple values save their results as a PyObject referenced by the
``rlpy_value`` variable.
This should be declared by the host program somewhere in scope.

The json parser, and parsers for python objects and lists keep a stack of 
parent objects in a python array named ``rlpy_stack``.


License
-------

RagelPyExt is made available under the terms of the mit license.  See LICENSE_ for details.


Bugs
----

Please post any issues or feature requests to the bugtracker_

.. _LICENSE: https://github.com/bwhmather/ragel-py-ext/blob/master/LICENSE
.. _bugtracker: https://github.com/bwhmather/ragel-py-ext/issues>`_
