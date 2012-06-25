<script type="text/javascript">
function preview(el){
	$.post('<?php echo site_url('/admin/blog/preview'); ?>', { body: $(el).val() }, function(data){
		$('div.preview').html(data);
	});
}
$(function(){
	$('div.category>span, div.category>input').hover(
		function() {
			if (!$(this).prev('input').attr('checked') && !$(this).attr('checked')){
				$(this).parent().addClass('hover');
			}
		},
		function() {
			if (!$(this).prev('input').attr('checked') && !$(this).attr('checked')){
				$(this).parent().removeClass('hover');
			}
		}
	);	
	$('div.category>span').click(function(){
		if ($(this).prev('input').attr('checked')){
			$(this).prev('input').attr('checked', false);
			$(this).parent().removeClass('hover');
		} else {
			$(this).prev('input').attr('checked', true);
			$(this).parent().addClass('hover');
		}
	});
	$('textarea#body').focus(function(){
		$('.previewbutton').show();
	});
	$('textarea#body').blur(function(){
		preview(this);
	});
	preview($('textarea#body'));
});
</script>

<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" class="default">

<h1 class="headingleft"><?php echo $title_add_blog; ?> <small>(<a href="<?php echo site_url('/admin/blog'); ?>">Voltar para notícias</a>)</small></h1>

<div class="headingright">
	<input type="submit" value="Salvar alterações" class="button" />
</div>

<div class="clear"></div>

<?php if ($errors = validation_errors()): ?>
	<div class="error">
		<?php echo $errors; ?>
	</div>
<?php endif; ?>

<h2 class="underline">Conteúdo e Classificação</h2>

<label for="postName">Título:</label>
<?php echo @form_input('postTitle', set_value('postTitle', $data['postTitle']), 'id="postTitle" class="formelement"'); ?>
<br class="clear" />

<label>Categoria: <small>[<a href="<?php echo site_url('/admin/blog/categories'); ?>" onclick="return confirm('Você irá perder as alterações.\n\nContinuar?')">Atualizar</a>]</small></label>
<div class="categories">
	<?php if ($categories): ?>
	<?php foreach($categories as $category): ?>
		<div class="category">
			<?php echo @form_checkbox('catsArray['.$category['catID'].']', $category['catName']); ?><span><?php echo $category['catName']; ?></span>
		</div>
	<?php endforeach; ?>
	<?php else: ?>
		<div class="category">
			<strong>AVISO:</strong> É extremamente recomendado o uso de categoria ou sua notícia pode não aparecer no site. <a href="<?php echo site_url('/admin/blog/categories'); ?>" onclick="return confirm('Você perderá as alterações.\n\nContinuar?')"><strong>Por favor atualiza sua caterogia aqui.</strong></a>.
		</div>
	<?php endif; ?>
</div>
<br class="clear" />

<div class="buttons">
	<a href="#" class="boldbutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_bold.png" alt="Bold" title="Negrito" /></a>
	<a href="#" class="italicbutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_italic.png" alt="Italic" title="Italico" /></a>
	<a href="#" class="h1button"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_h1.png" alt="Heading 1" title="Cabeçario 1"/></a>
	<a href="#" class="h2button"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_h2.png" alt="Heading 2" title="Cabeçario 2" /></a>
	<a href="#" class="h3button"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_h3.png" alt="Heading 3" title="Cabeçario 3" /></a>	
	<a href="#" class="urlbutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_url.png" alt="Insert Link" title="Inserir Link" /></a>
	<a href="<?php echo site_url('/admin/images/browser'); ?>" class="halogycms_imagebutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_image.png" alt="Insert Image" title="Inserir Imagem" /></a>
	<a href="<?php echo site_url('/admin/files/browser'); ?>" class="halogycms_filebutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_file.png" alt="Insert File" title="Inserir arquivo" /></a>
	<a href="#" class="previewbutton"><img src="<?php echo $this->config->item('staticPath'); ?>/images/btn_save.png" alt="Preview" title="Visualizar" /></a>	
</div>

<div class="autosave">
	<label for="body">Texto:</label>
	<?php echo @form_textarea('body', set_value('body', $data['body']), 'id="body" class="formelement code half"'); ?>
	<div class="preview"></div>
</div>
<br class="clear" /><br />

<label for="excerpt">Resumo:</label>
<?php echo @form_textarea('excerpt', set_value('excerpt', $data['excerpt']), 'id="excerpt" class="formelement code short"'); ?>
<br class="clear" /><br />

<h2 class="underline">Publicação e Opções</h2>

<label for="tags">Palavras-chaves: <br /></label>
<?php echo @form_input('tags', set_value('tags', $data['tags']), 'id="tags" class="formelement"'); ?>
<span class="tip">Separe as palavras-chaves com vírgula (e.g. &ldquo;lugares, hobbies, trabalho&rdquo;)</span>
<br class="clear" />

<label for="published">Publicar:</label>
<?php 
	$values = array(
		1 => 'Sim',
		0 => 'Não (salvar como rascunho)',
	);
	echo @form_dropdown('published',$values,set_value('published', $data['published']), 'id="published"'); 
?>
<br class="clear" />	

<label for="allowComments">Permitir comentários?</label>
<?php 
	$values = array(
		1 => 'Sim',
		0 => 'Não',
	);
	echo @form_dropdown('allowComments',$values,set_value('allowComments', $data['allowComments']), 'id="allowComments"'); 
?>
<br class="clear" /><br />
		
<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>
	
</form>
