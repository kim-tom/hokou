require 'digest/md5'
require 'active_record'

ActiveRecord::Base.configurations=YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection :database2

class Account <ActiveRecord::Base
end

#Basic Information
username="teacher"  #student
rawpasswd="pass_tchr" #pass_stu
algorithm="1"
r=Random.new
salt=Digest::MD5.hexdigest(r.bytes(20))
hashed=Digest::MD5.hexdigest(salt+rawpasswd)

puts "salt=#{salt}"
puts "username=#{username}"
puts "algorithm=#{algorithm}"
puts "hashed passwd=#{hashed}"

#Update database
s=Account.new
s.id=username
s.salt=salt
s.hashed=hashed
s.algo=algorithm
s.save

#Display all entries in database
@s=Account.all
@s.each do |a|
  puts a.id+"\t"+a.salt+"\t"+a.hashed+"\t"+a.algo
end
