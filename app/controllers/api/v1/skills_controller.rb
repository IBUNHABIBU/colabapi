module Api
    module V1
      class SkillsController < ApplicationController
        def index
          @skills = Skill.all
          render json: SkillsRepresenter.new(@skills).as_json
        end
  
        def create
          @skill = skill.new(skill_params)
          if @skill.save
            render json: { result: @skill, status: :created }
          else
            render json: { errors: @skill.errors.full_messages }
          end
        end

        private
  
        def skill_params
          params.require(:skill).permit(:name)
        end
      end
    end
  end