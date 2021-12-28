class Admin::BadgesController < Admin::BaseController

  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[show edit update destroy]
  before_action :set_rule, only: %i[new edit update]

  def show
  end

  def index
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), flash: { success: t('.success') }
    else
      flash[:danger] = t('.fail')
      rendeer :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge), flash: { success: t('.success') }
    else
      flash[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, flash: { danger: t('.success') }
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end

  def set_rule
    @rules = Badge::RULES
  end

  def badge_params
    params.require(:badge).permit(:img_name, :title, :rule, :rule_value, :description)
  end

end
