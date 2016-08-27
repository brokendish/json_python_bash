#!/usr/bin/python3

# -*- coding: utf-8 -*-

import json

class JsonGet(object):

	__key = ""
	__js = ""
	
	def __init__( self ):
		self.__js=""
		self.__jsonFile = 'test.json'

	def openData( self ):
		f = open(self.__jsonFile,'r')
		self.__js = json.load(f)
		f.close()

	def getData( self ):
		ret=""
		for lis in self.__js:
			ret += "infilename=" + lis["infilename"] + " "
			if "env" in lis:
				for nex in lis["env"]:
					ret += "AA_PATH=" + nex["AA_PATH"] + " " 
					ret += "AA_OUT=" + nex["AA_OUT"] + " "
				ret +='\n'
	
		print(ret)
aaa = JsonGet()
aaa.openData()
aaa.getData()
