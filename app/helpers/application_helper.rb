module ApplicationHelper
  
	def full_title(page_title)
		base_title = "Whitby Studio" 
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def submit_button_message(button_message)
		"#{button_message}"
	end

	def link_to_remove_fields(name, f, opt={})
    opt.store(:onclick, "remove_fields(this); return false")
    f.hidden_field(:_destroy) + link_to(name, " ", opt)
	end
 
	def link_to_add_fields(name, f, association, opt={})
    	new_object = f.object.class.reflect_on_association(association).klass.new
    	fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      		render(association.to_s + "/" + association.to_s.singularize + "_fields", :f => builder)
      end
      opt.store(:onclick, "add_fields(this, \"#{ association }\", \"#{ escape_javascript(fields) }\"); return false")
      
       link_to(name, " ", opt)
  end
  
  def active_link(c)
   # unless current_page?(root_path)
      params[:controller] == c ? "active-link" : ""
   # end
  end
    
    def format_time(t)
      t.strftime("%I:%M %p") 
    end
    
    def format_time_short(t)
      t.strftime("%l:%M") 
    end
    
    def format_day(d)
      d.strftime("%A, %b #{d.day.ordinalize}, %Y")
    end

    def join_date_time(d, t)
      dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    end
    
    def display_error(object, field)
      if object.errors.any?
        if object.errors[field.to_sym].present?
        '<div class="field inline alert alert-error"><i class="icon-warning-sign icon-white"></i>'.html_safe + " #{object.errors[field.to_sym].first}" + '</div>'.html_safe
        end
      end
    end
    
    def us_states
        [
          ['Alabama', 'AL'],
          ['Alaska', 'AK'],
          ['Arizona', 'AZ'],
          ['Arkansas', 'AR'],
          ['California', 'CA'],
          ['Colorado', 'CO'],
          ['Connecticut', 'CT'],
          ['Delaware', 'DE'],
          ['District of Columbia', 'DC'],
          ['Florida', 'FL'],
          ['Georgia', 'GA'],
          ['Hawaii', 'HI'],
          ['Idaho', 'ID'],
          ['Illinois', 'IL'],
          ['Indiana', 'IN'],
          ['Iowa', 'IA'],
          ['Kansas', 'KS'],
          ['Kentucky', 'KY'],
          ['Louisiana', 'LA'],
          ['Maine', 'ME'],
          ['Maryland', 'MD'],
          ['Massachusetts', 'MA'],
          ['Michigan', 'MI'],
          ['Minnesota', 'MN'],
          ['Mississippi', 'MS'],
          ['Missouri', 'MO'],
          ['Montana', 'MT'],
          ['Nebraska', 'NE'],
          ['Nevada', 'NV'],
          ['New Hampshire', 'NH'],
          ['New Jersey', 'NJ'],
          ['New Mexico', 'NM'],
          ['New York', 'NY'],
          ['North Carolina', 'NC'],
          ['North Dakota', 'ND'],
          ['Ohio', 'OH'],
          ['Oklahoma', 'OK'],
          ['Oregon', 'OR'],
          ['Pennsylvania', 'PA'],
          ['Puerto Rico', 'PR'],
          ['Rhode Island', 'RI'],
          ['South Carolina', 'SC'],
          ['South Dakota', 'SD'],
          ['Tennessee', 'TN'],
          ['Texas', 'TX'],
          ['Utah', 'UT'],
          ['Vermont', 'VT'],
          ['Virginia', 'VA'],
          ['Washington', 'WA'],
          ['West Virginia', 'WV'],
          ['Wisconsin', 'WI'],
          ['Wyoming', 'WY']
        ]
    end
      
end
