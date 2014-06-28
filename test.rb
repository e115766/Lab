require 'mysql'
require 'MeCab'
#db = Mysql.connect('localhost', 'root', '', 'diseases')
#db.query('select id, name, diagnose from diseases where diagnose like "%症状の現れ方%"').each do |col1, col2, col3|
#    print col3.gsub(/<\/?[^>]*>/, "")
#end
sentence = MeCab::Tagger.new()
node = sentence.parseToNode("天気晴朗なれども波高し")
while node do
    str = node.feature.force_encoding("UTF-8")
    if /^名詞/ =~ str
	puts node.surface
    end
    node = node.next
end
