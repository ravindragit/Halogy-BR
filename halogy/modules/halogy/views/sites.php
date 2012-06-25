<style type="text/css">
.ac_results { padding: 0px; border: 1px solid black; background-color: white; overflow: hidden; z-index: 99999; }
.ac_results ul { width: 100%; list-style-position: outside; list-style: none; padding: 0; margin: 0; }
.ac_results li { margin: 0px; padding: 2px 5px; cursor: default; display: block; font: menu; font-size: 12px; line-height: 16px; overflow: hidden; }
.ac_results li span.email { font-size: 10px; } 
.ac_loading { background: white url('<?php echo $this->config->item('staticPath'); ?>/images/loader.gif') right center no-repeat; }
.ac_odd { background-color: #eee; }
.ac_over { background-color: #0A246A; color: white; }
</style>

<script language="javascript" type="text/javascript" src="<?php echo $this->config->item('staticPath'); ?>/js/jquery.fieldreplace.js"></script>
<script type="text/javascript">
$(function(){
    $('#searchbox').fieldreplace();
	function formatItem(row) {
		if (row[0].length) return row[1]+'<br /><span class="email">('+row[0]+')</span>';
		else return 'No results';
	}
	$('#searchbox').autocomplete("<?php echo site_url('/halogy/ac_sites'); ?>", { delay: "0", selectFirst: false, matchContains: true, formatItem: formatItem, minChars: 2 });
	$('#searchbox').result(function(event, data, formatted){
		$(this).parent('form').submit();
	});	
});
</script>

<h1 class="headingleft">Seus sites</h1>

<div class="headingright">

	<form method="post" action="<?php echo site_url('/halogy/sites'); ?>" class="default" id="search">
		<input type="text" name="searchbox" id="searchbox" class="formelement inactive" title="Buscar Sites..." />
		<input type="image" src="<?php echo $this->config->item('staticPath'); ?>/images/btn_search.gif" id="searchbutton" />
	</form>

	<a href="<?php echo site_url('/halogy/add_site'); ?>" class="button">Novo site</a>
</div>

<div class="clear"></div>

<?php if ($sites): ?>

<?php echo $this->pagination->create_links(); ?>

<table class="default">
	<tr>
		<th><?php echo order_link('halogy/sites/viewall','siteName','Nome do Site'); ?></th>
		<th><?php echo order_link('halogy/sites/viewall','dateCreated','Data de criação'); ?></th>
		<th><?php echo order_link('halogy/sites/viewall','siteDomain','Dominios'); ?></th>
		<th><?php echo order_link('halogy/sites/viewall','altDomain','Domínios estacionados'); ?></th>		
		<th class="narrow"><?php echo order_link('halogy/sites/viewall','active','Estatus'); ?></th>		
		<th class="tiny">&nbsp;</th>
		<th class="tiny">&nbsp;</th>
	</tr>
<?php
	$i=0;
	foreach ($sites as $site):
	$class = ($i % 2) ? ' class="alt"' : ''; $i++;
?>
	<tr<?php echo $class; ?>>
		<td><?php echo anchor('/halogy/edit_site/'.$site['siteID'], $site['siteName']); ?></td>
		<td><?php echo dateFmt($site['dateCreated']); ?></td>		
		<td><?php echo $site['siteDomain']; ?></td>
		<td><?php echo $site['altDomain']; ?></td>		
		<td>
			<?php
				if ($site['active']) echo '<span style="color:green"><strong>Ativado</strong></span>';
				if (!$site['active']) echo '<span style="color:red">Suspenso</span>';
			?>
		</td>	
		<td class="tiny">
			<?php echo anchor('/halogy/edit_site/'.$site['siteID'], 'Editar'); ?>
		</td>
		<td class="tiny">
			<?php echo anchor('/halogy/delete_site/'.$site['siteID'], 'Apagar', 'onclick="return confirm(\'Tem certeza que quer apagar?\n\nApagando este site não terá como restaurar!\')"'); ?>
		</td>
	</tr>
<?php endforeach; ?>
</table>

<?php echo $this->pagination->create_links(); ?>

<p style="text-align: right;"><a href="#" class="button grey" id="totop">Volta para o topo</a></p>

<?php else: ?>

	<?php if (count($_POST)): ?>
	
		<p>Nenhum site.</p>
	
	<?php else: ?>
	
		<p>Você não tem nenhum site ainda. Crie um usando o link &ldquo;Novo Site&rdquo; acima.</p>
	
	<?php endif; ?>

<?php endif; ?>

