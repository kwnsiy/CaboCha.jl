# CaboCha.jl
係り受け解析

## usage
`example.jl`

```julia
include("CaboCha.jl")

sentence = "クロールで泳いでいる少女を見た"
println(cabocha_parser(sentence, option = "f0"))
println(cabocha_parser(sentence, option = "f1")) # default
println(cabocha_parser(sentence, option = "f3"))
```

`option="f0"`
```
クロールで-D    
  泳いでいる-D  
        少女を-D
            見た
EOS
```

`option="f1"`
```
* 0 1D 0/1 1.171920
クロール	名詞,一般,*,*,*,*,クロール,クロール,クロール
で	助詞,格助詞,一般,*,*,*,で,デ,デ
* 1 2D 0/2 1.603103
泳い	動詞,自立,*,*,五段・ガ行,連用タ接続,泳ぐ,オヨイ,オヨイ
で	助詞,接続助詞,*,*,*,*,で,デ,デ
いる	動詞,非自立,*,*,一段,基本形,いる,イル,イル
* 2 3D 0/1 1.603103
少女	名詞,一般,*,*,*,*,少女,ショウジョ,ショージョ
を	助詞,格助詞,一般,*,*,*,を,ヲ,ヲ
* 3 -1D 0/1 0.000000
見	動詞,自立,*,*,一段,連用形,見る,ミ,ミ
た	助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
EOS
```

`option="f3"`
```xml
?xml version="1.0" encoding="utf-8"?>
<sentence>
 <chunk id="0" link="1" rel="D" score="1.171920" head="0" func="1">
  <tok id="0" feature="名詞,一般,*,*,*,*,クロール,クロール,クロール">クロール</tok>
  <tok id="1" feature="助詞,格助詞,一般,*,*,*,で,デ,デ">で</tok>
 </chunk>
 <chunk id="1" link="2" rel="D" score="1.603103" head="2" func="4">
  <tok id="2" feature="動詞,自立,*,*,五段・ガ行,連用タ接続,泳ぐ,オヨイ,オヨイ">泳い</tok>
  <tok id="3" feature="助詞,接続助詞,*,*,*,*,で,デ,デ">で</tok>
  <tok id="4" feature="動詞,非自立,*,*,一段,基本形,いる,イル,イル">いる</tok>
 </chunk>
 <chunk id="2" link="3" rel="D" score="1.603103" head="5" func="6">
  <tok id="5" feature="名詞,一般,*,*,*,*,少女,ショウジョ,ショージョ">少女</tok>
  <tok id="6" feature="助詞,格助詞,一般,*,*,*,を,ヲ,ヲ">を</tok>
 </chunk>
 <chunk id="3" link="-1" rel="D" score="0.000000" head="7" func="8">
  <tok id="7" feature="動詞,自立,*,*,一段,連用形,見る,ミ,ミ">見</tok>
  <tok id="8" feature="助動詞,*,*,*,特殊・タ,基本形,た,タ,タ">た</tok>
 </chunk>
</sentence>
```
