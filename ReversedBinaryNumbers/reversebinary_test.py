import unittest
from reversebinary import ReverseBinary


class TestReverseBinary(unittest.TestCase):
    def test_reverse(self):
        rb = ReverseBinary("13")
        rb2 = ReverseBinary("47")
        self.assertEqual(rb.perform_reversal(), "11")
        self.assertEqual(rb2.perform_reversal(), "61")

if __name__ == "__main__":
    unittest.main()
