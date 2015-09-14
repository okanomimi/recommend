#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'MeCab'
require 'yaml'
require 'pry'
require '/home/okano/okano/RRSP/v0.3/rubyOkn/BasicTool'
require '/home/okano/okano/RRSP/v0.3/rubyOkn/StringTool'
require '/home/okano/okano/RRSP/v0.3/rubyOkn/MathTool'
require 'rubygems'  # Ruby 1.8 対応のため rubygems を require しているが Ruby 1.9 では不要である
require 'sqlite3'

include SQLite3
include BasicTool  ;
include StringTool;
include MathTool;
# sentence = "太郎はこの本を二郎を見た女性に渡した。"

# db = Database.new("test.db")

$db = Database.new("test.db")
def insert_db(word, result)

sql=<<EOS
create table if not exists #{word}(
  id integer primary key autoincrement, 
  fac text, 
  pro text
) ;
EOS

$db.execute(sql)
result.each do |(k, v)|
$db.execute("insert into #{word} (fac,pro) values('#{k}', '#{v.to_s}')") ; 

end

end

word_list = YAML.load_file("word_list.yml")
word_list.each do |word|
  f = open('data_set/'+word+'.txt')
  sentence = f.read()
  f.close()

  mecab = MeCab::Tagger.new
  node = mecab.parseToNode(sentence)
  word_array = []

  #名詞だけとってくる
  begin
    node = node.next
    if /^名詞/ =~ node.feature.force_encoding("UTF-8")
      word_array << node.surface.force_encoding("UTF-8")
    end
  end until node.next.feature.include?("BOS/EOS")

  #以下、全角文字を取る
  new_word_array = remove_zenkaku(word_array)
  #とれた文字をハッシュ化する
  hash = array_to_numarray(new_word_array)

  #出てきた単語順に並べる
  hash = hash.sort{|(k1, v1), (k2, v2) | v2 <=> v1}

  #要素の個数を限定する（今回は500?)
  # sorted_array = Array.new ;
  max_v = 0 ;
  min_v = 10000 ;
  cutted_hash = Hash.new ;
  hash.each_with_index do |(k,v),i|
    if i == 500
      break ;
    end
    # sorted_array.push({k => hyperbolic(v)}) ;
    # sorted_array.push({k => v}) ;
    if max_v < v
      max_v = v ;
    end
    if min_v > v
      min_v = v ;
    end
    cutted_hash[k] = v ;
  end
 
  # cutted_array = Array.new ; 
  # cutted_array = Array.new ; 
  result_hash = Hash.new ; 
  cutted_hash.each do |h|
    h[1] = (h[1].to_f - min_v.to_f)/(max_v.to_f-min_v.to_f) ;
    result_hash[h[0]] = h[1] ;
  end 
  makeYamlFile("data_set/"+word+".yml",result_hash) ;

  insert_db(word, result_hash)
end

binding.pry ;
