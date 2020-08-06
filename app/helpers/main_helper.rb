module MainHelper
  def add_to_list_link(exercise)
    link_to("<i class='material-icons' style='position: relative;top: 6px;'>playlist_add</i>".html_safe,
            {:controller => "trainingsplans", :action => "load_trainingsplans", :exercise => exercise.id},
            {:remote => true, :method => :post,:title => "add to trainingsplan",:class=>"add_to_playlist"}) if logged_in?
  end

  def add_to_list_with_trainingsplan(exercise,trainingsplan)
    link_to("<i class='material-icons' title='Zum Trainingsplan #{trainingsplan.name} hinzufügen' style='font-size: 2rem !important;'>add_circle_outline</i>".html_safe,
            {:controller => "main", :action => "add_exercise", :exercise => exercise.id, :trainingsplan_id => trainingsplan.id },
            {:remote => true, :method => :post ,:title => "add to trainingsplan",:class=>"add_to_playlist"})
  end
end
