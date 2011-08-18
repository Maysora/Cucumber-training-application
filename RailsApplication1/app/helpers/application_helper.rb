module ApplicationHelper
  # convert \n to <br />
  def n2br text, safe_tags=["br"]
    sanitize text.to_s.gsub("\n", "<br>").html_safe, :tags => safe_tags
  end
end
