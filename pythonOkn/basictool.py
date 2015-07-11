# -*- coding: utf_8 -*- 

import yaml

def load_yml(file_name):
    f = open(file_name, "r")
    result = yaml.load(f)
    f.close()
    return result


def write_txtfile(file_name, data):
    f = open(file_name, "w")
    f.write(data)
    f.close() 



