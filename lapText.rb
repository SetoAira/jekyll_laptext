module Jekyll
	module Tags
		class LapTextTag < Liquid::Block
			Syntax = /^\s*(\d+)?(\s+)?(open|close)?/

			def initialize(tag_name, options, tokens)
				super
				
				@id = ""
				@checked = ""
				
				if options =~ Syntax then
					unless $1.nil? then
						@id = $1
					end
					if $3 == "open" then
						@checked = "checked=\"checked\" "
					end
				end
				
			end
			
			def render(context)
				source = super
				source.gsub!(/^\n/, "")
				source.gsub!(/\n/, "<br />\n")
				
				return "<div><input type=\"checkbox\" id=\"lapBtn#{@id}\" class=\"lapBtnBox\" #{@checked}/><label class=\"lapBtn\" for=\"lapBtn#{@id}\"></label>\n<p class=\"lapTxt\">#{source}</p></div>\n"
			end

		end
	end
end

Liquid::Template.register_tag('laptext', Jekyll::Tags::LapTextTag)
