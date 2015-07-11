#!/usr/bin/ruby
# -*- coding: utf-8 -*-

system("ruby SettingMaker.rb")
system("python get_data_for_similarity.py")
system("ruby txt_to_hash.rb")
system("python calc_similarity_test.py")
