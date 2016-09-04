class JobScreen < PM::Screen
  stylesheet JobScreenStylesheet

  attr_accessor :job

  def on_load
    self.title = @job.title

    @content = append!(UILabel, :job_content)
    @content.text = @job.content

    @image = append!(UIImageView, :job_image).style { |st| st.remote_image = @job.image_url }
  end

  def will_animate_rotate(_orientation, _duration)
    reapply_styles
  end
end
