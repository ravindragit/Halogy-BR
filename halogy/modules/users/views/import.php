<h1>Importar usuários <small>(<a href="/admin/users">Voltar para Usuários</a>)</small></h1>

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

<p>Para importar usuario para o sistema é necessário criar um arquivo CSV com a primeira coluna como E-Mail, a segunda com o Primeiro Nome e a terceira como Segundo Nome.</p>

<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" enctype="multipart/form-data" class="default">
		<label for="csv">Arquivo CSV:</label>
		<div class="uploadfile">
			<?php echo @form_upload('csv', '', 'size="16" id="csv"'); ?>
		</div>
		<br class="clear" />

		<input type="hidden" name="test" value="" />

		<input type="submit" value="Enviar arquivo" class="button nolabel" id="submit" />
		
</form>
