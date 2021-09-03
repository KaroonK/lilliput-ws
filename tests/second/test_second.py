import unittest, os

class TestSecond(unittest.TestCase):
  def test_second(self):
    second = os.getenv('second', None)
    self.assertEqual(second, None)

if __name__ == '__main__':
  unittest.main()
