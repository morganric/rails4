$( document ).ready(function() {

	$('#submit-button').on('click', function(event) {
		event.preventDefault();
		var username = $('#username').val();
		console.log(username);
		var url = "https://api.mixcloud.com/"+username+"/listens/";
		console.log(url);

		$('#cloud').html('');



		$.ajax({
		  type: "GET",
		  url: url,
		  dataType: "jsonp",
		  success: function(data) {
		  	console.log('success');	
  			var totalTags = [];

		  	for ( var i = 0; i < data.data.length; i++ ) {
		  			var names = [];
		  			var tags = data.data[i].tags;

		  			for ( var j = 0; j < tags.length; j++ ) {
		  					names.push({name: tags[j].name, link: tags[j].url });
		  			}
				    totalTags.push(names);
				}

			var mergedTags = [];
			mergedTags = mergedTags.concat.apply(mergedTags, totalTags);	

		    var tag_array = [];
		    var names_array = [];


		    for ( var i = 0; i < mergedTags.length; i++ ) {
		    	names_array.push(mergedTags[i].name);
		    }

		    for ( var i = 0; i < mergedTags.length; i++ ) {

		    	// Returns weight for tag name
		    	var target = mergedTags[i].name;
		    	var weight = $.grep(names_array, function (elem) {
				    return elem === target;
				}).length; 

		    	tag_array.push({text: mergedTags[i].name, weight:  weight, link: mergedTags[i].link });
		    }


		    var uniqueNames = [];
		    var uniqueWeightedTags1 = [];
	      	var uniqueWeightedTags2 = [];
			
		    for ( var i = 0; i < tag_array.length; i++ ) {

		    	if($.inArray(tag_array[i].text, uniqueNames) === -1) {
					uniqueNames.push(tag_array[i].text);
					uniqueWeightedTags1.push(tag_array[i]);
				}
			}

			$(function() {
		        // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
		        $("#cloud").jQCloud(uniqueWeightedTags1, {

		        	afterCloudRender: function() {
		        		$('#cloud a').attr('target','_blank');
		        		console.log('blanks');
		        	}
		        });

		         console.log(uniqueWeightedTags1);

		         	   

		      });



		  }
		});

	});

});


