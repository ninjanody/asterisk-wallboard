WallboardSystem::Application.routes.draw do

  #root :to => redirect("/users/sign_in") # Make Sign In home page
  root :to => "home#index"
  
  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # Home controller
  match "/refresh-stats" => "home#refresh_stats", :as => "refresh_stats"
  
  # Manager routes
  match "/manager" => "manager#index", :as => "manager_index"
  match "/manager/agent-logoff/:agent_id/:queue" => "manager#agent_logoff", :as => "manager_agent_logoff"
  match "/manager/reset-queue-stats/:queue" => "manager#reset_queue_stats", :as => "manager_reset_queue_stats"
  match "/manager/refresh-stats" => "manager#refresh_stats", :as => "manager_refresh_stats"
  match "/manager/pause-agent/:queue_id/:agent_id" => "manager#pause_agent", :as => "manager_pause_agent"
  match "/manager/unpause-agent/:queue_id/:agent_id" => "manager#unpause_agent", :as => "manager_unpause_agent"
  
  # Agent routes
  match "/agent" => "agent#index", :as => "agent_index"
  match "/agent/logon/:queue_id" => "agent#logon", :as => "agent_logon"
  match "/agent/logoff/:queue_id" => "agent#logoff", :as => "agent_logoff"
  match "/agent/pause/:queue_id" => "agent#pause", :as => "agent_pause"
  match "/agent/unpause/:queue_id" => "agent#unpause", :as => "agent_unpause"
  match "/agent/refresh-stats" => "agent#refresh_stats", :as => "agent_refresh_stats"
  match "/agent/edit-ext" => "agent#edit_ext", :as => "agent_edit_ext"
  match "/agent/update-ext" => "agent#update_ext", :as => "agent_update_ext"
  
end
