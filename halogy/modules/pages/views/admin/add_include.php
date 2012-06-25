
<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" class="default">

	<h1 class="headingleft">Nova 
		<?php echo ($type == 'css' || $type == 'js') ? 'File' : 'Include'; ?>
		<?php
			if ($type == 'C') $typeLink = 'css';
			elseif ($type == 'J') $typeLink = 'js';
			else $typeLink = '';
		?>
		<small>(<a href="<?php echo site_url('/admin/pages/includes/'.$typeLink); ?>">Voltar aos Inclusos</a>)</small>
	</h1>

	<div class="headingright">
		<input type="submit" value="Alterar modificações" class="button" />
	</div>
	
	<div class="clear"></div>	

	<?php if ($errors = validation_errors()): ?>
		<div class="error">
			<?php echo $errors; ?>
		</div>
	<?php endif; ?>

<?php if ($type == 'css'): ?>

	<label for="includeRef">Arquivo:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Seu arquivo será encontrado em &ldquo;/css/filename.css&rdquo; (talvez será necessário usar a extensão '.css' ).</span><br class="clear" />

	<?php echo @form_hidden('type', 'C'); ?>

<?php elseif ($type == 'js'): ?>

	<label for="includeRef">Arquivo:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Seu arquivo será encontrado em &ldquo;/js/filename.js&rdquo; (talvez será necessário usar a extensão '.js' ).</span><br class="clear" />

	<?php echo @form_hidden('type', 'J'); ?>

<?php else: ?>

	<label for="includeRef">Referência:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Para acessar este incluso use {include:REFERENCE} em seu layout.</span><br class="clear" />

	<?php echo @form_hidden('type', 'H'); ?>

<?php endif; ?>

	<div class="autosave">
		<label for="body">Marcação:</label>	
		<?php echo @form_textarea('body',set_value('body', $data['body']), 'id="body" class="code editor"'); ?>
		<br class="clear" />
	</div>
		
	<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar ao topo</a></p>
	
</form>