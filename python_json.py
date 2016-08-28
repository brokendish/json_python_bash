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
			for keys in list(lis.keys()):
				if keys == self.__array_col:
					for nex in lis[keys]:
						for next in list(nex.keys()):
							ret += next + "=" + nex[next] + " "
				else:
					ret += keys + "=" + lis[keys] + " "
			ret +='\n'	
		print(ret)

jg = JsonGet()
jg.openData()
jg.getData()
