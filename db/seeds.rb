
# create default points
poins = [
  { name: '编程语言', code: 'language', description: 'Java, Ruby, PHP etc.' },
  { name: 'Web前端', code: 'frontend', description: 'Javascript, css, html etc.' },
  { name: '移动开发', code: 'mobile', description: 'iOS, Android etc.' },
  { name: '操作系统', code: 'os', description: 'Mac, Linux, Windows etc.' },
  { name: '数据存储', code: 'storage', description: 'Redis, Mysql, Mongodb etc.' },

  { name: '求职招聘', code: 'job', description: '收罗靠谱人才和招聘信息' },
  { name: '项目部署', code: 'deploy', description: '一键部署, 服务器搭建' },
  { name: '工具分享', code: 'kit', description: '分享下最新的, 不错的工具' },
  { name: '求疑解惑', code: 'question', description: '分享问题, 解答问题' },
  { name: '人生理想', code: 'chat', description: '瞎扯淡, 闲聊话题' },

  { name: '其它类别', code: 'other', description: '找不到类别时就选这个吧' }
]

poins.each do |p|
  Point.find_or_create_by(code: p[:code]) do |point|
    point.name = p[:name]
    point.description = p[:description]
  end
  point = Point.find_by(code: p[:code])
  puts "Success create: ", point.inspect
end
