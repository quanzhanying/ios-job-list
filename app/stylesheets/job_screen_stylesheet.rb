class JobScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def job_content(st)
    st.frame = { top: 100, left: 20, width: 100, height: 30 }
    st.color = color.black
  end

  def job_image(st)
    st.frame = { top: 200, left: 10, width: 200, height: 200 }
    st.background_color = color.black
  end

  def root_view(st)
    st.background_color = color.white
  end
end
