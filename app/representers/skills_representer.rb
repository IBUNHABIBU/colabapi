class SkillsRepresenter
    def initialize(skills)
      @skills = skills
    end
  
    def as_json
      skills.map do |skill|
        {
          id: skill.id,
          title: skill.name,
        }
      end
    end
  
    private
  
    attr_reader :skills
  end