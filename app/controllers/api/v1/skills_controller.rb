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
  
        def show
          @project = Project.find(params[:id])
          render json: ProjectRepresenter.new(@project).as_json
        end
  
        def destroy
          Project.find(params[:id]).destroy!
          head :no_content
        end
  
        private
  
        def project_params
          params.require(:skill).permit(:title, :github, :demo, :languages, :screenshot)
        end
      end
    end
  end