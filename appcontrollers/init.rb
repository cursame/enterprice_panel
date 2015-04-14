####### call configurations ######
require './appcontrollers/configs'
####### call home controller ######
require './appcontrollers/home'
####### call db managments ########
require './appcontrollers/dbmanagment'


def h(html)
  CGI.escapeHTML html
end
