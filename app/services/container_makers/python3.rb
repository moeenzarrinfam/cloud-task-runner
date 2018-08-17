require 'erb'
require 'fileutils'
module ContainerMakers
  class Python3
    include Peafowl

    attribute :task, Task

    validates :task, presence: true

    def call
      project_path = "tmp/containers/#{@task.environment.name}/#{@task.uid}"
      FileUtils.mkdir_p project_path
      system("cd #{project_path} && unzip #{@task.file.path}")

      File.open("#{project_path}/entrypoint.sh", 'w') do |f|
        f.write(
          ERB.new(
            File.read("lib/templates/erb/docker/#{@task.environment.name}/entrypoint.sh.erb")
          ).result(binding)
        )
      end

      File.open("#{project_path}/docker-compose.yml", 'w') do |f|
        f.write(
          ERB.new(
            File.read("lib/templates/erb/docker/#{@task.environment.name}/docker-compose.yml.erb")
          ).result(binding)
        )
      end
      Python3Worker.perform_async(task.id)
    end
  end
end
