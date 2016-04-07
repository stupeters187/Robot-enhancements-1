class Robot
  class DeadRobotError < StandardError
  end

  class NotRobotError < StandardError
  end

  attr_reader :x, :y, :items, :items_weight
  attr_accessor :equipped_weapon

  CAPACITY = 250
  MIN_HEALTH = 0
  MAX_HEALTH = 100
  DEFAULT_DAMAGE = 5

  def initialize
    @x = 0  
    @y = 0
    @items_weight = 0
    @health = 100
    @items = []
    @equipped_weapon = nil
  end

  def position
    [@x, @y]
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

  def health
    @health
  end

  def pick_up(item)
    if item.is_a?(Weapon)
      @equipped_weapon = item
    else
    end
    if (@items_weight + item.weight) <= CAPACITY
      @items.push(item)
      @items_weight += item.weight
    else
      false
    end
  end

  def wound(damage)
    if (@health - damage) >= MIN_HEALTH 
    @health -= damage
  else
    @health = 0
  end
  
  end

  def heal(health)
    if (@health + health) <= MAX_HEALTH
    @health += health
  end
  end

  def attack(enemy)
    if equipped_weapon
      equipped_weapon.hit(enemy)
    else
    end
    enemy.wound(DEFAULT_DAMAGE)
  end

  def heal!(robot)
    raise DeadRobotError if robot.health == 0
  end

  def attack!(target)
    raise NotRobotError unless target.is_a?(Robot)
  end




end
