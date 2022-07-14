# frozen_string_literal: true

require 'rexml/document'
include REXML

def check_each(e)
  pList = e.get_elements('p')
  # 遍历pList，i中的元素按顺序
  len = pList.size
  $i = 0
  while $i < len
    if pList[$i].attribute('i').to_s.to_i == ($i + 1)
      # puts "true"
    else
      puts pList
      puts 'Maybe have error in i......'
      puts "\n"
    end
    $i += 1
  end
end

msgXml = File.new('../sgserver/actorserver/services/msg/msg.xml')
erMsgXml = Document.new msgXml

erMsgXml.elements.each('packages/package') do |e|
  check_each(e)
end

erMsgXml.elements.each('packages/group/package') do |e|
  check_each(e)
end
