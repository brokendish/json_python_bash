#!/usr/bin/python3

# -*- coding: utf-8 -*-

import sys
import json

class JsonGet(object):

	def __init__( self ):
		param = sys.argv
		self.__jsonFile = param[1]
		self.__js=""
		self.__array_col = "env"

	def openData( self ):
		f = open(self.__jsonFile,'r')
		self.__js = json.load(f)
		f.close()

	def getData( self ):
		ret=""
		for lis in self.__js:
			for keyaa in list(lis.keys()):
				if keyaa == self.__array_col:
					for nex in list(lis[keyaa].keys()):
						ret += nex + "=" + lis[keyaa][nex] + " "
				else:
					ret += keyaa + "=" + lis[keyaa] + " "
			ret +='\n'	
		print(ret)

jg = JsonGet()
jg.openData()
jg.getData()
