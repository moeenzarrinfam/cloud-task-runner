class Python3Worker
  include Sidekiq::Worker

  def perform(task_id)
    task = Task.find(task_id)
    return if %i[done running].include? task.status

    project_path = "tmp/containers/#{task.environment.name}/#{task.uid}"
    running_time = ENV['TASK_RUNNING_TIME'].to_i

    if task.new_?
      task.update_attributes(status: :running)
      system("cd #{project_path} && docker-compose up -d")
      sleep(running_time)
      task.update_attributes(running_time: task.running_time + running_time)
    elsif task.paused?
      task.update_attributes(status: :running)
      system("cd #{project_path}  && docker unpause #{task.uid}")
      sleep(running_time)
      task.update_attributes(running_time: task.running_time + running_time)
    end

    pause_container(task)
    Python3Worker.perform_async(task.id) if task.paused?
  end

  def pause_container(task)
    task.update_attributes(status: :paused)
    begin
      pause_status = system("docker pause #{task.uid}")
      task.update_attributes(status: :done) unless pause_status
    rescue StandardError
      task.update_attributes(status: :done)
    end
  end
end
