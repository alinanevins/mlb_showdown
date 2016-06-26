class BaseStateImageService

  attr_accessor :ending_base_state_id

  def initialize(ending_base_state_id)
    @ending_base_state_id = ending_base_state_id
  end

  def base_state_image
    if @ending_base_state_id == 1
        <%= image_tag 'bs1.jpg', alt: 'empty bases' %>
    elsif @ending_base_state_id == 2
      <%= image_tag 'bs2.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 3
      <%= image_tag 'bs3.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 4
      <%= image_tag 'bs4.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 5
      <%= image_tag 'bs5.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 6
      <%= image_tag 'bs6.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 7
      <%= image_tag 'bs7.jpg', alt: 'runner on first' %>
    elsif @ending_base_state_id == 8
      <%= image_tag 'bs8.jpg', alt: 'runner on first' %>
    end
  end
end
