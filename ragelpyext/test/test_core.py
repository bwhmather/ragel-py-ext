import unittest

# compiled ragel extension module
from ragelpyext.test import _core


class RagelTestCase(unittest.TestCase):
    def test_basic(self):
        self.assertTrue(_core.is_hello('hello'))
        self.assertFalse(_core.is_hello('goodbye'))
