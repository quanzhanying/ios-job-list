class JobScreen < PM::Screen
  stylesheet JobScreenStylesheet

  attr_accessor :job

  def on_load
    self.title = @job.title
  end

  def will_animate_rotate(_orientation, _duration)
    reapply_styles
  end
end
