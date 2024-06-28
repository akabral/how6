module ApplicationHelper

  def nested_form(f, association)

    data = '<div id="meteorologies" class="nested-fields-container">'
    f.fields_for(association) do |association_values|
      data.concat(render(association.to_s.singularize + "_fields", f: association_values))
    end

    data.concat('</div>   <br />')

    data.concat('<div class="links">')
    data.concat(link_to_add_fields 'Add Meteorology', f, association, "#" + association.to_s.singularize)
    data.concat('</div> <br />)')
  return data
  end

  

  def link_to_add_fields(name, f, association, container)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: { id: id, fields: fields.delete("\n"), container: container })
  end

  def sidebar_menu(menu_items, level=0)
    # expanded = true
    menu_content = tag.ul(class: "list-unstyled ps-#{level}") do # Menu
      menu_items.map do |k, v| # Percorre itens do menu atual
        concat(tag.li(class: "mb-1") do # Item do menu
          if v.is_a?(Hash) # Tem subitens
            level += 1 # Adiciona um nível no menu
            returned_value = sidebar_menu(v, level) # Recursividade, Processa o subitem
            create_collapsable_link(k, returned_value) # Submenu colapsável
            set_submenu_content(k, returned_value) # Adiciona conteúdo do submenu
          else
            add_link(k, v) # Adiciona link que vai redirecionar para a página desejada
          end
        end)
      end
    end

    return {menu: menu_content, expanded: true}
  end

  private

  def create_collapsable_link(k, returned_value)
    concat(content_tag(
      :button,
      k,
      class: "btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed",
      data: {
        bs_toggle: "collapse",
        bs_target: "##{k}-collapse"
      },
      aria: {
        expanded: @expanded.to_sym == k.to_sym ? "true" : returned_value[:expanded]
      }
    ))
  end

  def set_submenu_content(k, returned_value)
    concat(tag.div(
      class: "collapse #{'show' if @expanded.to_sym === k.to_sym ? "true" : returned_value[:expanded]}",
      id: "#{k}-collapse"
    ) do
        returned_value[:menu]
    end)
  end

  def add_link(k, v)
    # if v != request.path
    #   expanded = false
    # end
    link_to(k, v, class: "btn d-inline-flex align-items-center rounded border-0")
  end


end
