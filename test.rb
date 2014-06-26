require 'mysql'
db = Mysql.connect('localhost', 'root', '', 'diseases')
db.query('select id, name, diagnose from diseases where diagnose like "%症状%"').each do |col1, col2, col3|
    print col3.gsub(/<\/?[^>]*>/, "")
end
