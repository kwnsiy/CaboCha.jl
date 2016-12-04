# coding:utf-8

using XMLconvert

doc=
"""
usage: 
  cabocha_parser("クロールで泳いでいる少女を見た")
  This function takes a dictionary as a return value.
""

""" cabocha_parser """
function cabocha_parser(sentence)
  res = readall(pipeline(`echo $sentence`, `cabocha -f3`))
  return xml2dict(root(parse_string(res)))
end

