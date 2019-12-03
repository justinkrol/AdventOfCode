require_relative 'spacecraft_module'

class FuelCounterUpper
  def initialize(masses_enumerator, spacecraft_module_klass = SpacecraftModule)
    @masses_enumerator = masses_enumerator
    @spacecraft_module_klass = spacecraft_module_klass
  end

  def sum
    @masses_enumerator.sum do |mass|
      @spacecraft_module_klass.new(mass.to_i).fuel_requirement
    end
  end
end
