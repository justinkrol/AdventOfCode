class RecursiveSpacecraftModule
  def initialize(mass)
    @mass = mass
  end

  def fuel_requirement
    fuel_for_mass(@mass)
  end

  private

  def fuel_for_mass(mass)
    fuel = (mass / 3) - 2
    return 0 if fuel <= 0

    fuel + fuel_for_mass(fuel)
  end
end
