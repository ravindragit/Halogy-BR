<script type="text/javascript">
$(function(){
	$('div.permissions input[type="checkbox"]').each(function(){
		if ($(this).attr('checked')) {
			$(this).parent('div').prev('div').children('input[type="checkbox"]').attr('checked', true);
		}
	});
	$('.selectall').click(function(){
		$el = $(this).parent('div').next('div').children('input[type="checkbox"]');
		$flag = $(this).attr('checked');
		if ($flag) {
			$($el).attr('checked', true);
		}
		else {
			$($el).attr('checked', false);
		}
	});
	$('.seemore').click(function(){
		$el = $(this).parent('div').next('div');
		$($el).toggle('400');
	});
	$('a.selectall').click(function(event){
		event.preventDefault();
		$('input[type="checkbox"]').attr('checked', true);
	});
	$('a.deselectall').click(function(event){
		event.preventDefault();
		$('input[type="checkbox"]').attr('checked', false);
	});
});
</script>

<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" class="default">

	<h1 class="headingleft">Editar Grupo de Usuários <small>(<a href="<?php echo site_url('/admin/users/groups'); ?>">Voltar para Grupo de Usuários</a>)</small></h1>

	<div class="headingright">
		<input type="submit" value="Salvar alterações" class="button" />
	</div>
	
	<div class="clear"></div>
	
	<?php if ($errors = validation_errors()): ?>
		<div class="error">
			<?php echo $errors; ?>
		</div>
	<?php endif; ?>

	<label for="groupName">Nome do grupo:</label><br class="clear" />
	<?php echo @form_input('groupName',set_value('groupName', $data['groupName']), 'id="groupName" class="formelement"'); ?>
	<br class="clear" /><br />

	<?php if ($permissions): ?>

	<h3>Permissões administrativas</h3>
	
	<p><a href="#" class="selectall button small nolabel grey">Marcar todas</a> <a href="#" class="deselectall button small grey">Desmarcar todas</a></p>
	
	<?php foreach ($permissions as $cat => $perms): ?>

		<div class="perm-heading">
			<label for="<?php echo strtolower($cat); ?>_all" class="radio"><?php echo $cat; ?></label>
			<input type="checkbox" class="selectall checkbox" id="<?php echo strtolower($cat); ?>_all" />
			<input type="button" value="Veja mais" class="seemore small-button" />
		</div>

		<div class="permissions">

		<?php foreach ($perms as $perm): ?>

			<label for="<?php echo 'perm_'.$perm['key']; ?>" class="radio"><?php echo $perm['permission']; ?></label>
			<?php echo @form_checkbox('perm'.$perm['permissionID'], 1, set_value('perm'.$perm['permissionID'], $data['perm'.$perm['permissionID']]), 'id="'.'perm_'.$perm['key'].'" class="checkbox"'); ?>
			<br class="clear" />

		<?php endforeach; ?>

		</div>

	<?php endforeach; ?>
	<?php endif; ?>


	<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>
	
</form>
