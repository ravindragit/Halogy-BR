<h1 class="headingleft">Notícias</h1>

<div class="headingright">
	<?php if (in_array('blog_edit', $this->permission->permissions)): ?>
		<a href="<?php echo site_url('/admin/blog/add_post'); ?>" class="button">Adicionar notícias</a>
	<?php endif; ?>
</div>

<?php if ($blog_posts): ?>

<?php echo $this->pagination->create_links(); ?>

<table class="default clear">
	<tr>
		<th><?php echo order_link('/admin/blog/viewall','posttitle','Chamadas'); ?></th>
		<th><?php echo order_link('/admin/blog/viewall','datecreated','Data'); ?></th>
		<th class="narrow"><?php echo order_link('/admin/blog/viewall','published','Publicada'); ?></th>
		<th class="tiny">&nbsp;</th>
		<th class="tiny">&nbsp;</th>
	</tr>
<?php foreach ($blog_posts as $post): ?>
	<tr class="<?php echo (!$post['published']) ? 'draft' : ''; ?>">
		<td><?php echo (in_array('blog_edit', $this->permission->permissions)) ? anchor('/admin/blog/edit_post/'.$post['postID'], $post['postTitle']) : $post['postTitle']; ?></td>
		<td><?php echo dateFmt($post['dateCreated'], '', '', TRUE); ?></td>
		<td>
			<?php
				if ($post['published']) echo '<span style="color:green;">Sim</span>';
				else echo 'Não';
			?>
		</td>
		<td class="tiny">
			<?php if (in_array('blog_edit', $this->permission->permissions)): ?>
				<?php echo anchor('/admin/blog/edit_post/'.$post['postID'], 'Editar'); ?>
			<?php endif; ?>
		</td>
		<td class="tiny">			
			<?php if (in_array('blog_delete', $this->permission->permissions)): ?>
				<?php echo anchor('/admin/blog/delete_post/'.$post['postID'], 'Apagar', 'onclick="return confirm(\'Quer realmente apagar?\')"'); ?>
			<?php endif; ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>

<?php echo $this->pagination->create_links(); ?>

<p style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>

<?php else: ?>

<p class="clear">Não existem notícias cadastradas.</p>

<?php endif; ?>