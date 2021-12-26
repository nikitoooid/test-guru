class BadgeService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @current_test = @test_passage.test
    @current_user = @test_passage.user
    @badges = Badge.all
  end

  def call
    new_badges = []

    @badges.each do |badge|
      if send("#{badge.rule}_rule_observed?", badge)
        new_badges.push(badge)
        @current_user.badges.push(badge)
      end
    end
    
    new_badges
  end

  private

  def first_rule_observed?(badge)
    passed_tests = @current_test.test_passages.where(user_id: @current_user.id).count
    @test_passage.passed? && passed_tests == 1
  end

  def category_rule_observed?(badge)
    success_tests_by_category = passed.by_category(badge.rule_value).uniq.count
    all_tests_by_category = Test.by_category(badge.rule_value).count
    success_tests_by_category == all_tests_by_category && !@current_user.badges.include?(badge)
  end

  def level_rule_observed?(badge)
    success_tests_by_level = passed.by_level(badge.rule_value).uniq.count
    all_tests_by_level = Test.by_level(badge.rule_value).count
    success_tests_by_level == all_tests_by_level && !@current_user.badges.include?(badge)
  end

  def passed
    @current_user.tests.where("test_passages.passed = true")
  end
end