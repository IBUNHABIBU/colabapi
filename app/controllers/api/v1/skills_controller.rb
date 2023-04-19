module Api
    module V1
      class SkillsController < ApplicationController
        def index
          @skills = Skill.all
          render json: SkillsRepresenter.new(@skills).as_json
        end
  
        def create
          @project = Project.new(project_params)
          if @project.save
            render json: { result: @project, status: :created }
          else
            render json: { errors: @project.errors.full_messages }
          end
        end
  
        
  
        
  
        private
  
        def project_params
          params.require(:skill).permit(:name)
        end
      end
    end
  end