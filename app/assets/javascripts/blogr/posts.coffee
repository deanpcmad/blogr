# Generate the post permalink when a post title has been typed
$ ->
	generatePermalink = (text) ->
		text.replace(/[^a-z0-9]+/gi, '-').replace(/^-*|-*$/g, '').toLowerCase()

	$("a[data-preview=1]").on 'click', (e) ->
		e.preventDefault()
		$.post $(@).data('url'), post: { content: $("#post_content").val() }, (data) ->
			$("#preview").html(data)
			$("#preview").attr('title', $("#post_title").val())
			$("#preview").dialog
				width:  '90%'
				height: $(window).height() * 0.8
				modal: true

	$("input#post_title").focusout ->
		$("input#post_permalink").val(generatePermalink($(this).val()))

	$(document).ready ->
  		$("#post_content").autosize append: "\n"

	# $("select#post_category_id").change(->
	# 	str = ""
	# 	$("select option:selected").each ->
	# 		if $(this).val() == ""
	# 			str += "posts"
	# 		else
	# 			str += $(this).text() + " "

	# 	$("span.category").replaceWith("<span class='category'>" + generatePermalink(str) + "</span>")
	# ).change()


	# $("#post_published").click ->
	# 	$(".published_date").toggle @checked