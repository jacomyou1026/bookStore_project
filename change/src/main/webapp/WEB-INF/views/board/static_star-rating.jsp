<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	 function ratingToPercent() {
        var score = 1 * 20;
        return score + 1.5;
        
        //var aa = document.getElementById("aa");
        //aa.style.width = score;
  	 } 
</script>
<div class="star-ratings">
	<div id="aa"
    class="star-ratings-fill space-x-2 text-lg"
     style="width: ${vo.rating}%" >
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div>
	<div class="star-ratings-base space-x-2 text-lg">
		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
	</div>
</div>