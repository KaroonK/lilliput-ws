import unittest, os

class TestThird(unittest.TestCase):
  def test_third(self):
    third = os.getenv('third', None)
    self.assertEqual(third, None)

if __name__ == '__main__':
  unittest.main()
