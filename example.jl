include("CaboCha.jl")

sentence = "クロールで泳いでいる少女を見た"

# 解析結果、Dict型、添え字は1から
@show cabocha_parser(sentence)

# 標準出力のみ(第二引数指定) #
println(cabocha_parser(sentence, "f0"))
println(cabocha_parser(sentence, "f1")) 
println(cabocha_parser(sentence, "f3"))
