import os, unittest, xmlrunner

if __name__ == '__main__':
  root_dir = os.path.dirname(__file__)
  test_loader = unittest.TestLoader()
  package_tests = test_loader.discover(start_dir=root_dir)
  if not os.path.exists('logs'):
    os.makedirs('logs')
  testRunner = xmlrunner.XMLTestRunner(open('logs/test_results.xml','wb'), failfast = False)
  testRunner.run(package_tests)
