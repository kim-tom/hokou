# coding: utf-8
require 'digest/md5'
require 'active_record'

ActiveRecord::Base.configurations=YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection :production

class Account <ActiveRecord::Base
  self.table_name = "accounts"
end
class Hokou <ActiveRecord::Base
  self.table_name = "hokous"
end

Hokou.create(
  grade: 4,
  dptmnt: 'J',
  date_rest: '2016/2/5',
  koma_rest: '4',
  date_ex:'2016/2/16',
  koma_ex:'1',
  subject:'応用物理2',
  teacher: '奥村',
  bikou:' '
)
Hokou.create(
  grade: 5,
  dptmnt: 'M',
  date_rest: '2016/2/5',
  koma_rest: '4',
  date_ex:'2016/2/16',
  koma_ex:'1',
  subject:'量子コンピュータ',
  teacher: '掛川',
  bikou:' '
)
Hokou.create(
  grade: 1,
  dptmnt: 'M',
  date_rest: '2016/2/5',
  koma_rest: '4',
  date_ex:'2016/2/16',
  koma_ex:'1',
  subject:'男道',
  teacher: '清原和博',
  bikou:' '
)


#Basic Information
array=[["teacher","pass_tchr"],["student","pass_stu"]]

array.each do |act|
  username=act[0]
  rawpasswd=act[1]
  algorithm="1"
  r=Random.new
  salt=Digest::MD5.hexdigest(r.bytes(20))
  hashed=Digest::MD5.hexdigest(salt+rawpasswd)

  puts "salt=#{salt}"
  puts "username=#{username}"
  puts "algorithm=#{algorithm}"
  puts "hashed passwd=#{hashed}"
  if Account.find_by(id: username).nil?
    #Update database
    s=Account.new
    s.id=username
    s.salt=salt
    s.hashed=hashed
    s.algo=algorithm
    s.save
  end
end

#Display all entries in database
@s=Account.all
@s.each do |a|
  puts a.id.to_s+"\t"+a.salt+"\t"+a.hashed+"\t"+a.algo
end
