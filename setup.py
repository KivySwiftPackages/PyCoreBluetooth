from setuptools import setup, Extension
from setuptools.command.build_ext import (
    build_ext
)
import subprocess

class SPWExtension(Extension):
	def __init__(self):
		#super().__init__("", [os.fspath(Path("").resolve())])
		super().__init__("spw", ["./"])

class BuildSwiftPackage(build_ext):
	
	def build_extension(self, ext: SPWExtension):
		cwd = self.build_lib
		print("Generating Pip Files:", cwd)
		
		subprocess.run([
			"swift", "package",
			"--sdk", "iphoneos",
   			"plugin","--allow-writing-to-package-directory",# cwd,
			"PyFileGenerator", cwd
			
		])

setup(
	ext_modules=[SPWExtension()],
	cmdclass={
		"build_ext": BuildSwiftPackage,
	}
)
