class Update

  attr_reader :slug

  FILENAME_FORMAT = /^(.*)(\.[^.]+)$/

  def initialize(path)
    @path = path
    @slug = File.basename(path).match(FILENAME_FORMAT).captures[0]
  end

  def content
    load_content
    @content
  end

  def parse_content
    @parse_content = Maruku.new(content)
  end

  def content_html
    parse_content.to_html
  end

  def title
    content_html.match(/^<h1.*>(.*)<\/h1>/).captures[0]
  end

  class << self
    def all
      @@updates ||= Dir.glob(Explora.root + "/../updates/*.md").map do |filename|
        Update.new filename
      end.sort_by(&:slug).reverse
    end

    def find slug
      conditions[:slug] = slug
      all.select do |update|
        conditions.all? { |key, value| post.send(key) == value }
      end
    end

  end

  protected

  def load_content
    @content = File.read(@path)
    if @content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      @content = @content[($1.size + $2.size)..-1]
      @metadata = YAML.load($1)
    end
    @metadata = Hashie::Mash.new(@metadata || {})
  end
end