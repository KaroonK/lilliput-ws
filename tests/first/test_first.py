import unittest, os

class TestFirst(unittest.TestCase):
  def test_first(self):
    first = os.getenv('first', None)
    print(first)
    self.assertEqual(first, None)

if __name__ == '__main__':
  unittest.main()
