####### call configurations ######
require './appcontrollers/configs'
####### call home controller ######
require './appcontrollers/home'


def h(html)
  CGI.escapeHTML html
end
