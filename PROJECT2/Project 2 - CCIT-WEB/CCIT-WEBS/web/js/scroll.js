$(document).ready(function () {
    	        $(".section").css("min-height", $(window).height() + "px");
    	        $(".container-fluid").sectionsnap({
    	            delay: 100
                    , selector: '.section'
                    , reference: 1
                    , animationTime: 600
    	        });
    	    });