#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require "pry"
require '/home/okano/okano/RRSP/v0.3/rubyOkn/BasicTool'

include BasicTool

# word_list = ["テニス", "野球", "サッカー", "ピアノ", "剣道", "ソフトテニス"]
word_list = ["猫", "犬", "サッカー", "ピアノ", "テニス", "ソフトテニス", "バトミントン", "野球"]

makeYamlFile("word_list.yml", word_list) ;

