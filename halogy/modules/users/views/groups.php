<h1 class="headingleft">Grupo de Usuários</h1>

<div class="headingright">

	<?php if (in_array('users', $this->permission->permissions)): ?>
		<a href="<?php echo site_url('/admin/users'); ?>" class="button blue">Usuários</a>
	<?php endif; ?>

	<?php if (in_array('users_groups', $this->permission->permissions)): ?>
		<a href="<?php echo site_url('/admin/users/add_group'); ?>" class="button">Adicionar grupo</a>
	<?php endif; ?>
</div>

<?php if ($permission_groups): ?>

<?php echo $this->pagination->create_links(); ?>

<table class="default clear">
	<tr>
		<th><?php echo order_link('/admin/users/viewall','groupName','Nome do grupo'); ?></th>
		<th class="tiny">&nbsp;</th>
		<th class="tiny">&nbsp;</th>		
	</tr>
<?php foreach ($permission_groups as $group): ?>
	<tr>
		<td><?php echo (in_array('users_groups', $this->permission->permissions)) ? anchor('/admin/users/edit_group/'.$group['groupID'], $group['groupName']) : $group['groupName']; ?></td>
		<td class="tiny">
			<?php echo anchor('/admin/users/edit_group/'.$group['groupID'], 'Editar'); ?>
		</td>
		<td class="tiny"
			<?php echo anchor('/admin/users/delete_group/'.$group['groupID'], 'Apagar', 'onclick="return confirm(\'Tem certeza que deseja apagar?\')"'); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>

<?php echo $this->pagination->create_links(); ?>

<p style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>

<?php else: ?>

<p class="clear">Você ainda não tem acesso.</p>

<?php endif; ?>