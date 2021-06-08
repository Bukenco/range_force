module Statistics
  class ModuleServices

    attr_accessor :errors

    def initialize(params)
      @params = params
      @errors = []
    end

    def json_view
      { list: @modules.as_json }
    end

    def top_modules_json_view
      { top_list: @top_modules.as_json(only: [:game_course_module_id, :count, :name]) }
    end

    def modules
      @modules =  GameModule
                      .select("game_modules.id, game_modules.name, game_modules.description, course_categories.name as category")
                      .joins(game_course_modules: [game_course: :course_category])
                      .group_by(&:category)

    end

    def top_modules
      @top_modules = UserCourseModule
                          .select("game_course_module_id, COUNT(*) as count, game_modules.name")
                          .joins(game_course_module: :game_module)
                          .where("user_course_modules.created_at >= :date", date: DateTime.now.beginning_of_month)
                          .group("game_course_module_id, game_modules.name")
                          .order("count DESC")
                          .limit(10)
    end
  end
end