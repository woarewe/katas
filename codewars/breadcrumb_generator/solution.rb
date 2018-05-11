require 'active_support/core_ext/string'

IGNORE_WORDS = %w[the of in from by with and or for to at a].freeze
IGNORE_DOMAINS = %w[.html .htm .php .asp].freeze

def generate_bc(url, separator)
  urls = parse_urls(url)
  urls.map do |h|
    h.eql?(urls.last) ? "<span class=\"active\">#{h[:text]}</span>" : "<a href=\"#{h[:href]}\">#{h[:text]}</a>"
  end.join(separator)
end

def parse_urls(url)
  links = url.remove(/[?|#].*/, /\/index.*$/, *IGNORE_DOMAINS, /https?:\/\//).split(/\//)
  href = ''
  links[0] = 'home'
  links.map! do |link|
    href << "#{link unless link.eql?(links.first)}/"
    {
      href: href.dup,
      text: fix_tag_text(link)
    }
  end
end

def fix_tag_text(text)
  result =
    if text.size > 30
      (text.split('-') - IGNORE_WORDS).map { |word| word[0] }.join
    else
      text.gsub(/-/, ' ')
    end
  result.upcase
end