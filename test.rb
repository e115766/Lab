require 'mysql'
require 'MeCab'
data = []
db = Mysql.connect('localhost', 'root', '', 'diseases')
sentence = MeCab::Tagger.new()
db.query('select id, name, description from diseases where description like "%症状の現れ方%"').each do |col1, col2, col3|
    node = sentence.parseToNode(col3.gsub(/<\/?[^>]*>|[A-z]|[Ａ-ｚ]|[0-9]|[０-９]/, ""))
    while node do
	str = node.feature.force_encoding("UTF-8")
	if /^動詞/ =~ str
	    data.push(node.surface)
	end
	node = node.next
    end
end

k = Hash.new(0)
data.each{|x| k[x] += 1}
k = k.sort{|(k1, v1), (k2, v2)| v1 <=> v2 }
k.each{|x| puts x[0], x[1]}
