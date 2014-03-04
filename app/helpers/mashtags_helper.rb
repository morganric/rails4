module MashtagsHelper

    require 'mixcloud'


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

		@tags_names_weighted.map { |name|

			@word_array << {"text" => name[0], "weight" => name[1]}
		}

	end


end
