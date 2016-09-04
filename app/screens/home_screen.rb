class HomeScreen < PM::TableScreen
  title '職缺一覽'
  stylesheet HomeScreenStylesheet

  def on_load
    @jobs = []
    load_jobs
  end

  def load_jobs
    Job.all do |response, jobs|
      if response.success?
        @jobs = jobs
        stop_refreshing
        update_table_data
      else
        app.alert 'Sorry, there was an error fetching the jobs.'
        mp response.error.localizedDescription
      end
    end
  end

  def table_data
    [{
      cells: @jobs.map do |job|
        {
          height: 100,
          title: job.title,
          action: :view_job,
          arguments: { job: job }
        }
      end
    }]
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(_orientation, _duration)
    find.all.reapply_styles
  end
end
