class HomeScreen < PM::TableScreen
  title "職缺一覽"
  stylesheet HomeScreenStylesheet

  include NavigationHelper

  def on_load
    add_side_menu

    @jobs = []
    load_jobs
  end

  def sign_out_button
    Auth.sign_out do
      app.delegate.open_authenticated_root
    end
  end

  def sign_in_button
    open SignInScreen.new(nav_bar: true)
  end

  def load_jobs
    Job.all do |response, jobs|
      if response.success?
        @jobs = jobs
        stop_refreshing
        update_table_data
      else
        app.alert "Sorry, there was an error fetching the jobs."
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
          subtitle: job.content,
          action: :view_job,
          arguments: { job: job }
        }
      end
    }]
  end

  def view_job(args)
    open JobScreen.new(args)
  end

  def will_animate_rotate(_orientation, _duration)
    find.all.reapply_styles
  end
end
