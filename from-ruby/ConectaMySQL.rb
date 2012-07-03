#!/usr/bin/ruby

require "mysql"

begin
    con = Mysql.new 'localhost', 'root', 'root', 'mysql'

    res = con.query("show tables;")

    fields = res.fetch_fields
    res.each do |row|
    	    puts row.join("\t")
    end
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
