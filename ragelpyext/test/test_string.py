import unittest

# compiled ragel extension module containing machines to test
from ragelpyext.test import _string


class RagelTestCase(unittest.TestCase):
    def test_cstring(self):
        self.assertEqual("cstring", _string.parse_cstring('"cstring"'))

# suite = unittest.TestLoader().loadTestsFromTestCase(RagelTestCase)
