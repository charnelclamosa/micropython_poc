from setuptools import setup, find_packages
import sdist_upip

with open("README.txt", "r", encoding = "utf-8") as fh:
  long_description = fh.read()

with open("version.txt", "r", encoding = "utf-8") as v:
  version = v.read()

setup(
  name= 'hottertimes_poc_package',
  version = version,
  author = 'Charnel Clamosa',
  author_email = 'charnel@zatonovo.com',
  description = 'TBD -- short package description',
  long_description = long_description,
  long_description_content_type = 'text/markdown',
  url = 'https://bitbucket.org/zatonovo/poc_python_package/src/master/',
  classifiers = [
    "Programming Language :: Python :: 3",
    "License :: OSI Approved :: MIT License",
    "Operating System :: OS Independent"
  ],
  package_dir = {'': 'python'},
  packages = find_packages(where='python'),
  include_dirs=True,
  include_package_data=True,
  python_requires='>=3.6',
  cmdclass={'sdist': sdist_upip.sdist}
)