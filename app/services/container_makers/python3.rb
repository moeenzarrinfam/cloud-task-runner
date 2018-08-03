require 'erb'
module ContainerMakers
  class Python3
    include Peafowl

    attribute :task, Task

    validates :task, presence: true

    def call
      project_path = "tmp/containers/#{@task.uid}"
      system("mkdir -p #{project_path}")
      # system("unzip #{@task.file.path} #{project_path}")

      File.open("#{project_path}/entrypoint.sh",'w') do |f|
        f.write(ERB.new("Hello <%= @task.uid%>").result(binding))
      end

      add_error!('') unless true

      context[:user] = { username: sample_username }
    end
  end
end