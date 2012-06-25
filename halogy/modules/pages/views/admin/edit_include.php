<script type="text/javascript">
$(function(){
	$('input#submit').click(function(){
		$('span.autosave-saving').fadeIn('fast');
		$.post('<?php echo site_url($this->uri->uri_string()); ?>', {
				includeRef: $('#includeRef').val(),
				body: $('#body').val()
		}, function(data){
			$('span.autosave-saving').fadeOut('fast');
			$('span.autosave-complete').text(data).fadeIn('fast').delay(3000).fadeOut('fast');
		});
		return false;
	});
});
</script>

<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" class="default">

	<h1 class="headingleft">Editar
		<?php echo ($type == 'C' || $type == 'J') ? 'File' : 'Include'; ?>
		<?php
			if ($type == 'C') $typeLink = 'css';
			elseif ($type == 'J') $typeLink = 'js';
			else $typeLink = '';
		?>
		<small>(<a href="<?php echo site_url('/admin/pages/includes'); ?>/<?php echo $typeLink; ?>">Voltar para Inclusos</a>)</small>
	</h1>
	
	<div class="headingright">
		<input type="submit" value="Salvar alterações" id="submit" class="button" />
	</div>
	
	<div class="clear"></div>	
	
	<?php if ($errors = validation_errors()): ?>
		<div class="error">
			<?php echo $errors; ?>
		</div>
	<?php endif; ?>
	<?php if (isset($message)): ?>
		<div class="message">
			<?php echo $message; ?>
		</div>
	<?php endif; ?>

<?php if ($type == 'C'): ?>

	<label for="includeRef">Nome do arquivo:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Seu arquivo será encontrado em &ldquo;/css/filename.css&rdquo; (certifique-se que esta usando a extensão '.css').</span><br class="clear" />

	<?php echo @form_hidden('type', 'C'); ?>

<?php elseif ($type == 'J'): ?>

	<label for="includeRef">Nome do arquivo:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Seu arquivo será encontrado em &ldquo;/js/filename.js&rdquo; (certifique-se que esta usando a extensão '.js').</span><br class="clear" />

	<?php echo @form_hidden('type', 'J'); ?>

<?php else: ?>

	<label for="includeRef">Referência:</label>
	<?php echo @form_input('includeRef',set_value('includeRef', $data['includeRef']), 'id="includeRef" class="formelement"'); ?>
	<span class="tip">Para acessar este Incluso use {include:REFERENCE} em seu layout.</span><br class="clear" />

	<?php echo @form_hidden('type', 'H'); ?>

<?php endif; ?>

	<div class="autosave">
		<span class="autosave-saving">Salvando...</span>
		<span class="autosave-complete"></span>
		<label for="body">Marcação:</label>	
		<?php echo @form_textarea('body',set_value('body', $data['body']), 'id="body" class="code editor"'); ?>
		<br class="clear" />
	</div>

	<h2>Versões</h2>	

	<ul>
	<?php if ($versions): ?>
		<?php foreach($versions as $version): ?>
			<li>
				<?php if ($data['versionID'] == $version['versionID']): ?>
					<strong><?php echo dateFmt($version['dateCreated'], '', '', TRUE).(($user = $this->core->lookup_user($version['userID'], TRUE)) ? ' <em>(by '.$user.')</em>' : ''); ?></strong>
				<?php else: ?>
					<?php echo dateFmt($version['dateCreated'], '', '', TRUE).(($user = $this->core->lookup_user($version['userID'], TRUE)) ? ' <em>(by '.$user.')</em>' : ''); ?> - <?php echo anchor('/admin/pages/revert_include/'.$version['objectID'].'/'.$version['versionID'], 'Reverter', 'onclick="return confirm(\'As alterações não salvas serão perdidas. Continuar?\');"'); ?>
				<?php endif; ?>
			</li>
		<?php endforeach; ?>	
	<?php endif; ?>
	</ul>

	<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar ao topo</a></p>

</form>	