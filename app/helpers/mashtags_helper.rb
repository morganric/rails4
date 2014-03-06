module MashtagsHelper

    require 'mixcloud'

      def base64_url_decode str
	     encoded_str = str.gsub('-','+').gsub('_','/')
	     encoded_str += '=' while !(encoded_str.size % 4).zero?
	     Base64.decode64(encoded_str)
	  end

	  def decode_data str
	    encoded_sig, payload = str.split('.')
	    data = ActiveSupport::JSON.decode base64_url_decode(payload)
	  end

	def views(mashtag)
		mashtag.views = mashtag.views + 1
	end


	def cloud (mashtag)
		@mixcloud_user = Mixcloud::User.new("http://api.mixcloud.com/#{mashtag.user_name}")

		@listens = JSON.parse RestClient.get(@mixcloud_user.listens_url)
		@tags = []

		@listens["data"].map { |listen| 

			listen["tags"].each do |tag|
				@tags << tag
			end
		}

		@tags_names = []
		@unique_weighted_tags = []

		@tags.map { |tag|

			@tags_hash = tag
			@tags_names << tag["name"] 

		}

		@tags_names_weighted = @tags_names.inject(Hash.new(0)) {|h,i| h[i] += 1; h }

		@word_array = []
		@tag_array = []		

		@tags_names_weighted.each do |name|

			@tags.each  do |tag|

				if tag["name"] === name[0]
					@link = tag["url"].to_s
					break
				end
			end 
			
			@word_array << {"text" => name[0], "weight" => name[1], "link" => @link }
		end


	end


end
