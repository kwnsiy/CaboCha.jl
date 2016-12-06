# coding:utf-8

doc = 
"""
usage: 
  cabocha_parser("クロールで泳いでいる少女を見た")
"""

""" cabocha_parser """
function cabocha_parser(sentence, option)
  return readall(pipeline(`echo $sentence`, `cabocha -$option`))
end

function cabocha_parser(sentence)
  sentence = replace(sentence, "\n", "")
  result = readall(pipeline(`echo $sentence`, `cabocha -f1`))
  d = Dict(:chunk_id => Array{Int, 1}(), :chunk => Array{UTF8String,1}(), :tok_surface => Array{Array{UTF8String,1},1}(),
           :tok_feature => Array{Array{UTF8String,1},1}(), :link => Array{Int, 1}(), :head => Array{Int, 1}(), :func => Array{Int, 1}())
  for line in split(result, "\n")
    line == "EOS" && break
    if ismatch(r"^\* \d+", line)
     tmp = split(line)
     push!(d[:chunk_id], parse(tmp[2])+1)
     push!(d[:chunk], "")  
     push!(d[:link], parse(tmp[3][1:end-1])+1)
     head, func = map(parse, split(tmp[4], "/"))
     push!(d[:head], head)
     push!(d[:func], func)
     push!(d[:tok_surface], Array{UTF8String,1}())
     push!(d[:tok_feature], Array{UTF8String,1}())
    else
     surface, feature = split(line, "\t")
     d[:chunk][end] = d[:chunk][end]*surface
      push!(d[:tok_surface][end], surface+1)
      push!(d[:tok_feature][end], feature+1)
    end
  end
  return d
end







