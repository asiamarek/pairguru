class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    if empty_brackets?(record.title) || single_brackets?(record.title)
      record.errors.add(:title, "has invalid title")
    end
  end

  private

  OPENING_BRACKETS = %w|( { [|.freeze
  CLOSING_BRACKETS = %w|) } ]|.freeze
  PAIRS_OF_BRACKETS = [%w[{ }], %w([ ]), %w[( )]].freeze

  def empty_brackets?(title)
    %w(() {} []).any? { |brackets| title.include?(brackets) }
  end

  def pair_of_brackets?(first_char, second_char)
    PAIRS_OF_BRACKETS.include?([first_char, second_char])
  end

  def single_brackets?(title)
    opened_brackets = []
    title.each_char do |c|
      if OPENING_BRACKETS.include?(c)
        opened_brackets << c
      elsif CLOSING_BRACKETS.include?(c)
        return true unless pair_of_brackets?(opened_brackets.last, c)
        opened_brackets.pop
      end
    end
    !opened_brackets.empty?
  end
end
