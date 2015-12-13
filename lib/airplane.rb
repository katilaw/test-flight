class Airplane
  attr_reader :type, :wing_loading, :horsepower
  def initialize(type,wing_loading,horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engines_status = "off!"
    @status = "grounded!"
  end

  def start
    if @engines_status == "off!"
      @engines_status = "airplane started"
    elsif @engines_status == "airplane started"
      @engines_status = "airplane already started"
    end
    @engines_status
  end

  def takeoff
    if @engines_status == "off!"
      @status = "airplane not started, please start"
    elsif @engines_status != "off!"
      @status = "airplane launched"
    end
    @status
  end

  def land
    if @engines_status!= "off!" && @status != "airplane launched"
      output = "airplane already on the ground"
    elsif @engines_status!= "off!" && @status == "airplane launched"
      output = "airplane landed"
    elsif @engines_status == "off!"
      output = "airplane not started, please start"
    else
      output = "huh?"
    end
    output
  end
end
