# # Usage
# after :restart, "delayed_job:restart"
#
namespace :delayed_job do
  def rails_env
    fetch(:rails_env, :production)
  end

  def args
    fetch(:delayed_job_args, "")
  end

  def delayed_job_roles
    fetch(:delayed_job_server_role, :app)
  end

  def delayed_job_command
    fetch(:delayed_job_command, "bin/delayed_job")
  end

  desc "Stop the delayed_job process"
  task :stop do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: rails_env do
          execute delayed_job_command, 'stop'
        end
      end
    end
  end

  desc "Start the delayed_job process"
  task :start do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: rails_env do
          execute delayed_job_command, "start #{args}"
        end
      end
    end
  end

  desc "Reload the delayed_job process"
  task :reload do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: rails_env do
          execute delayed_job_command, "reload #{args}"
        end
      end
    end
  end

  desc "Restart the delayed_job process"
  task :restart do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: rails_env do
          execute delayed_job_command, "restart #{args}"
        end
      end
    end
  end
end
