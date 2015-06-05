// (function($){
// 	// Begin creating your plugin
// 	$.fn.schrodTimeline = function(options){
// 		// Basic plugin shell, 
// 		// function passes in an options object 
// 		// with predefined settings.
// 		var settings = $.extend({
// 			// Default: Bare minimum
// 			// Robust: Include linkable categories
// 			type: "default"
// 			//All default settings for the plugin go here.

// 		}, options);
		
// 		return this.each(function(){
			
// 		});
// 	}

// }(jQuery));
$(document).ready(function(){
	var schrodTimeline = {
		tlEvents: [],
		stlEvents: [],
		makeEvent: function(){},
		generateEvents: function(array){
			this.sortbyTime(array);
			// var htmlArray = [];
			var $closeLink = $('<a>').text('close').addClass('close');
			console.log(array.length);
			for(i=0; i<array.length; i++){
				console.log(array[i].name);
				var date = new Date(array[i].date);
				var dateStr = date.toDateString();
				var $el = $('<div>').addClass('event-item').text(array[i].name).attr('id',array[i].id);
				var $date = $('<div>').addClass('date-item').append('<h2>'+dateStr+'</h2>');
				
				if(i===0 || (array[i].date !== array[i-1].date)){
					$('.timeline').append($date);
					console.log("this is true");
					$('.timeline').append($el);
				} else {
					console.log("this is false");
					$('.timeline').append($el);
				}
				// console.log($el);
			}
			$('.event-item').append($closeLink);
			this.tlEvents = array;
			return $el
		},
		sortbyTime: function(array){
			console.log(array);
			array.sort(function(a,b){
				var bD= new Date(b.date);
				var aD = new Date(a.date);
				if(bD > aD){
					return 1;
				}
				else if(bD < aD){
					return -1;
				}
				else{
					return 0;
				}
			});
			this.tlEvents = array;
			console.log(this.tlEvents);
			return array;
		},
		insertEvents: function(array){
			// debugger;
			var refArray = this.tlEvents.reverse();
			console.log(refArray);
			for (var i = 0; i<array.length; i++){
				var k = array[i];
				var kD = new Date(k.date);
				var kDstr = kD.toDateString;
				var $date = $('<div>').addClass('date-item').append('<h2>'+kDstr+'</h2>');
				var $el = $("<div>").addClass("event-item").attr('id',k.id).text(k.name);
				// console.log(k);
				for(var j=1; j<refArray.length;j++){
					var m = refArray[j-1];
					var refM = new Date(m.date);

					var l = refArray[j];
					var refL = new Date(l.date);
					
					if(kD>refL && kD<refM || (kD-refM===0)){
						$("#"+m.id).after($el);	
						if(kD.date !== m.date){
							$("#"+k.id).after($date);									
						}
						
					} else if(j === refArray.length-1){
						$("#"+l.id).after($el);
						if(kD,date !== l.date){
							
						}
					} else if(kD < refL){
						$('#'+l.id).before($el);
					}
				}
			}
		},
		addEvents: function(array){
			console.log(this.tlEvents.length);
			if(this.tlEvents.length===0){
				console.log("Create new events");
				this.generateEvents(array);
			}else{
				console.log("Insert event in between existing timeline events");
				this.insertEvents(array);
			}
			console.log(array);
		},
		removeEvent: function(node){
			var $deleted = $(node).closest('.event-item');
			var $delId = $deleted.attr('id');
			$deleted.remove();
			$.post('/timelines/'+ gon.timelineid,{ deletedevents: $delId },function (data){
			// SUCCESS HANDLER FOR POST!
				console.log("Post successfully deleted");
				schrodTimeline.tlEvents= data.timelineEvents;
				console.log(schrodTimeline.tlEvents);
			});
		},
		userInterface:function(){


		},
		initialize: function(array){
			this.tlEvents=[];
			this.tlEvents=array;
			this.generateEvents(array);
			this.userInterface();
		}
	}
	console.log(gon.events);

	var $selectedEvents=[];
	var evItm= gon.events;
		schrodTimeline.initialize(gon.timelineEvents);
	console.log(schrodTimeline.tlEvents);
				//REMOVE EVENT
			$('.timeline').on('click','.close', function(event){
				event.preventDefault();
				console.log("hello");
				schrodTimeline.removeEvent($(this));
			});

			//OPEN EVENT ADD INTERFACE
			$('.add_event').on('click', function(event){
				event.preventDefault();
				// $('.all_events').load('/events');
				if(gon.events){
					console.log("true");
					var $list="";
			
					var $addevent = '<div id="eventbucket" class="all_events"></div>'
					$('body').append($addevent);

						//ITERATE THROUGH event items from rails
						for(var i=0;i<evItm.length;i++){
							$list+="<div data-id='"+evItm[i].id+"' class='add-event-item'>"+evItm[i].name+"</div>";
						}

					//Append a list of shit 
					var $addconf = "<p class='addconf'>ADD ME</p>";
					$('#eventbucket').append($list);
					$('#eventbucket').append($addconf);

				}
			});

			$('body').on('click', ".add-event-item", function(event){
				console.log("safasfas");
				$(this).toggleClass("selected");
			});
			
			$('body').on('click',".addconf", function(event){
				event.preventDefault();
				var evArray=[];
				$(this).parent().find('.selected').each(function(){
					$selectedEvents.push($(this).data('id'));
				});

				console.log("These are selected events: "+$selectedEvents);
				for(var i=0;i<$selectedEvents.length;i++){
					
					var result = evItm.filter(function( obj ) {
						console.log(obj.id);
						return obj.id === $selectedEvents[i];
					});
					evArray.push(result);
					
				}
				console.log("This is the list of new events: "+evArray);
				for(var i = 0; i<evArray.length; i++){
					console.log(evArray[i][0]);
				}
				console.log("This is the result of your query: "+evArray);

				$.post('/timelines/'+ gon.timelineid,{ events: $selectedEvents },function (data) {
					// SUCCESS HANDLER FOR POST!
					// var $el = $("<div>").addClass("event-item");
					// $(".event-item:last-child").after($el);
					if(data.events){
						console.log(data.events);
						var newArray = schrodTimeline.addEvents(data.events);
					}else{
						console.log(data.status);
					}

				});
				$('#eventbucket').remove();
			});

});

