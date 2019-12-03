class SpacecraftModule
  def initialize(mass)
    @mass = mass
  end

  def fuel_requirement
    (@mass / 3) - 2
  end
end
