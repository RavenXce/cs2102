module ApplicationHelper
  def active_if_controller (compare)
    controller.controller_name == compare ? ' class=active' : ''
  end
end
