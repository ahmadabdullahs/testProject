module BugsHelper
  def options_for_bug_status_select(*statuses)
    options_for_select(statuses)
  end
end