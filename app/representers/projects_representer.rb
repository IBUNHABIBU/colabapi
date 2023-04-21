class ProjectsRepresenter
  def initialize(projects)
    @projects = projects
  end

  def as_json
    projects.map do |project|
      {
        id: project.id,
        title: project.title,
        github: project.github,
        demo: project.demo,
        languages: project.languages,
        imageUrl: project.imageUrl
      }
    end
  end

  private

  attr_reader :projects
end
