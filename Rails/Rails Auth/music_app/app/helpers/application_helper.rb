module ApplicationHelper
  def ugly_lyrics(lyrics)
    html = '<div class="lyrics">'
    lyrics.split("\r\n").each do |line|
      html += "<p>&#9835; #{h(line)}</p>"
    end
    html += '</div>'

    html.html_safe
  end
end
