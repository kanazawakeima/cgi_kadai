require 'pg'

connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  result = connection.exec("SELECT weight, give_for, quality FROM crops WHERE NOT give_for = '自家消費' and quality = true;")

  result.each do |record|

      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]} 品質：#{record["quality"]}"
  end
ensure
  connection.finish
end
