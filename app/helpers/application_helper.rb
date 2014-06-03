module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
  end

  def markdown text
    options = { hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    raw markdown.render(text)
  end

  def link_to_add_fields(name, f, association, locals={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", locals.merge!(:f => builder))
    end
    link_to(name, '#', class: "add_fields button small", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
