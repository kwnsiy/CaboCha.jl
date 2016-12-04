# coding:utf-8

include("CaboCha.jl")

sentence = "クロールで泳いでいる少女を見た"
xml = cabocha_parser(sentence)

println(xml)
