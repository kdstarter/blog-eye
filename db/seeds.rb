
# create default points
poins = [
  { name: '求职招聘', description: '收罗靠谱人才和招聘信息' },
  { name: '项目部署', description: '一键部署, 服务器搭建' },
  { name: '工具分享', description: '分享下最新的, 不错的工具' },
  { name: '求疑解惑', description: '分享问题, 解答问题' },
  { name: '人生理想', description: '瞎扯淡, 闲聊话题' },

  { name: 'Web前端', description: 'Javascript, css, html etc.' },
  { name: '编程语言', description: 'Ruby, Java etc.' },
  { name: '移动开发', description: 'iOS, Android etc.' },
  { name: '操作系统', description: 'Mac, Linux, Windows etc.' },
  { name: '数据仓库', description: 'Redis, Mysql, Mongodb etc.' },
  { name: '其它类别', description: '找不到类别时就选这个吧' }
]

poins.each do |p|
  Point.find_or_create_by(name: p[:name]) do |point|
    point.description = p[:description]
  end
  point = Point.find_by(name: p[:name])
  puts "Success create: ", point.inspect
end
