class MenuDrawer < PM::Menu::Drawer
  def setup
    self.center = HomeScreen.new(nav_bar: true)
    self.left = NavigationScreen
    self.to_show = [:pan_bezel, :pan_center]
    self.transition_animation = :slide
    self.max_left_width = 200
    self.shadow = false
  end
end
