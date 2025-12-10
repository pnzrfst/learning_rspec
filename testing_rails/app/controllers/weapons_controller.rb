class WeaponsController < ApplicationController
  before_action :set_weapon, only: [ :show, :destroy, :edit, :update  ]
  def index
    @weapons = Weapon.all
  end

  def show
  end

  def new
    @weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      redirect_to @weapon
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @weapon.update(weapon_params)
      redirect_to @weapon
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @weapon.destroy
    redirect_to weapons_path, notice: "Arma apagada com sucesso."
  end

  private
    def weapon_params
      params.expect(weapon: [ :name, :description, :level, :power_step, :power_base ])
    end

    def set_weapon
      @weapon = Weapon.find(params[:id])
    end
end
