# coding:utf-8

include("CaboCha.jl")

sentence = "クロールで泳いでいる少女を見た"
println(cabocha_parser(sentence, option = "f0"))
println(cabocha_parser(sentence, option = "f1")) # default
println(cabocha_parser(sentence, option = "f3"))
