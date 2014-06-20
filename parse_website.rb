class ParseWebsite
  def self.parse(*args)
    new(*args).parse
  end

  def website
    'http://www.website-for-parsing.fake'
  end

  def parse
    page
      .css("div.foo-bar select[name=my-select-box]")
      .last           # use the second select box
      .css("option")  # it's <option>
      .collect {|o| o['value']}
      .uniq           # uniq values
  end

  def page
    # http://ruby.bastardsbook.com/chapters/html-parsing/
    Nokogiri::HTML(open(website))
  end
end
