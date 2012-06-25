<h1>Comentários das Noticias</h1>

<?php if ($comments): ?>

<?php echo $this->pagination->create_links(); ?>

<table class="default clear">
	<tr>
		<th>Comentado em</th>
		<th>Notícia</th>
		<th>Autor</th>
		<th>E-mail</th>
		<th>Comentário</th>	
		<th>Status</th>
		<th class="tiny">&nbsp;</th>
		<th class="tiny">&nbsp;</th>
	</tr>
<?php foreach ($comments as $comment): ?>
	<tr>
		<td><?php echo dateFmt($comment['dateCreated']); ?></td>
		<td><?php echo anchor('/blog/'.dateFmt($comment['uriDate'], 'Y/m/').$comment['uri'], $comment['postTitle']); ?></td>
		<td><?php echo $comment['fullName']; ?></td>
		<td><?php echo $comment['email']; ?></td>
		<td><small><?php echo (strlen($comment['comment'] > 50)) ? htmlentities(substr($comment['comment'], 0, 50)).'...' : htmlentities($comment['comment']); ?></small></td>						
		<td><?php echo ($comment['active']) ? '<span style="color:green;">Ativo</span>' : '<span style="color:orange;">Pendente</span>'; ?></td>		
		<td><?php echo (!$comment['active']) ? anchor('/admin/blog/approve_comment/'.$comment['commentID'], 'Aprovar') : ''; ?></td>
		<td>
			<?php echo anchor('/admin/blog/delete_comment/'.$comment['commentID'], 'Apagar', 'onclick="return confirm(\'Quer realmente apagar?\')"'); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>

<?php echo $this->pagination->create_links(); ?>

<p style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>

<?php else: ?>

<p class="clear">Não existem comentários ainda.</p>

<?php endif; ?>

