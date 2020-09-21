module MainHelper
  def add_to_list_link(exercise)
    link_to("<i class='material-icons vertical_icon' >playlist_add</i>".html_safe,
            {:controller => "trainingsplans", :action => "load_trainingsplans", :exercise => exercise.id},
            {:remote => true, :method => :post, :title => "add to workout", :class => "add_to_playlist"}) if logged_in?
  end

  def add_to_list_with_trainingsplan(exercise, trainingsplan)
    link_to("<i class='material-icons vertical_icon' title='add to workout #{trainingsplan.name}'>add_circle_outline</i>".html_safe,
            {:controller => "main", :action => "add_exercise", :exercise => exercise.id, :trainingsplan_id => trainingsplan.id},
            {:remote => true, :method => :post, :title => "add to workout", :class => "add_to_playlist"})
  end
end
