# Declare module of your plugin under Jekyll module
module Jekyll::CustomFilter

  # Each method of the module creates a custom Jekyll filter
  def number_with_delimiter(input)
    if input
      whole, decimal = input.to_s.split(".")
      num_groups = whole.chars.to_a.reverse.each_slice(3)
      whole_with_commas = num_groups.map(&:join).join(',').reverse
      [whole_with_commas, decimal].compact.join(".")
    else
      "0"
    end
  end
end

Liquid::Template.register_filter(Jekyll::CustomFilter)
