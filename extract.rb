require 'mysql'
require 'MeCab'
def extract(str)
    /<h2 class=\"ttl\">症状の現れ方<\/h2>/ =~ str
    /<\/p>/ =~ $'
    p $`
end


data = []
db = Mysql.connect('localhost', 'root', '', 'diseases')
sentence = MeCab::Tagger.new()
db.query('select id, name, description from diseases where description like "%症状の現れ方%"').each do |col1, col2, col3|
    extract(col3)
end


