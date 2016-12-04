# coding:utf-8

using XMLconvert

doc = 
"""
usage: 
  cabocha_parser("クロールで泳いでいる少女を見た")
"""

""" cabocha_parser """
function cabocha_parser(sentence; option = "f1")
  return readall(pipeline(`echo $sentence`, `cabocha -$option`))
end

