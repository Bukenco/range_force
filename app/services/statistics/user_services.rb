module Statistics
  class UserServices

    attr_accessor :errors

    def initialize(params)
      @params = params
      @errors = []
    end

    def json_view
      {
          list_by_month: @top_users_by_month.as_json(only: [:user_account_id, :count, :username]),
          list_by_week: @top_user_by_week.as_json(only: [:user_account_id, :count, :username])
      }
    end

    def top_learners
      learners_by_month
      learners_by_week
    end

    private

    def learners_by_month
      @top_users_by_month = get_top_learners(DateTime.now.beginning_of_month)
    end

    def learners_by_week
      @top_user_by_week = get_top_learners(DateTime.now.beginning_of_week)
    end

    def get_top_learners(period)
      UserCourseModule
          .select("user_account_id, COUNT(*) as count, user_accounts.username")
          .joins(:user_account)
          .where("user_course_modules.created_at >= :date", date: period)
          .group("user_account_id, user_accounts.username")
          .order("count DESC")
          .limit(5)
    end
  end
end