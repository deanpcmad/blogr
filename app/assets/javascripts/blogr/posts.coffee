# Generate the post permalink when a post title has been typed
$ ->
	generatePermalink = (text) ->
		text.replace(/[^a-z0-9]+/gi, '-').replace(/^-*|-*$/g, '').toLowerCase()

	$("input#post_title").focusout ->
		$("input#post_permalink").hide()
		$("span.permalink").replaceWith("<span class='permalink'>" + generatePermalink($(this).val()) + "</span>")
		$("input#post_permalink").val(generatePermalink($(this).val()))
		$("a.edit_permalink").show()


	$(".edit_permalink").click ->
		$("span.permalink").hide()
		$("input#post_permalink").show()
		$("a.edit_permalink").hide()

	# $("select#post_category_id").change(->
	# 	str = ""
	# 	$("select option:selected").each ->
	# 		if $(this).val() == ""
	# 			str += "posts"
	# 		else
	# 			str += $(this).text() + " "

	# 	$("span.category").replaceWith("<span class='category'>" + generatePermalink(str) + "</span>")
	# ).change()


	# if there is a title then it will generate the permalink on page load
	if $("input#post_title").length
		if $("input#post_title")[0].value.length > 0
			title = $("input#post_title")[0].value
			$("input#post_permalink").hide()
			$("span.permalink").replaceWith("<span class='permalink'>" + generatePermalink(title) + "</span>")
			$("input#post_permalink").val(generatePermalink(title))
			$("a.edit_permalink").show()


	# $("#post_published").click ->
	# 	$(".published_date").toggle @checked