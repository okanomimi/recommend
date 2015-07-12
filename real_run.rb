#!/usr/bin/ruby
# -*- coding: utf-8 -*-

system("ruby SettingMaker.rb")
system("python get_data_for_similarity.py")
# system("ruby txt_to_hash.rb")
system("ruby txt_to_hash_mix_word.rb")
system("ruby calc_similarity.rb")
