<script type="text/javascript">
$(function(){
	$('a.showtab').click(function(event){
		event.preventDefault();
		var div = $(this).attr('href'); 
		$('div.tab').hide();
		$(div).show();
	});
	$('ul.innernav a').click(function(event){
		event.preventDefault();
		$(this).parent().siblings('li').removeClass('selected'); 
		$(this).parent().addClass('selected');
	});
	$('div.tab:not(#tab1)').hide();
	$('div.permissions input[type="checkbox"]').each(function(){
		if ($(this).attr('checked')) {
			$(this).parent('div').prev('div').children('input[type="checkbox"]').attr('checked', true);
		}
	});	
	$('input.selectall').click(function(){
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
	$('#siteDomain').change(function(){
		var domainVal = $(this).val();
		var tld = '';
		domainVal = domainVal.replace(/^(http)s?:\/+((w+)\.)?|^www\.|\/|\/(.+)/ig, '');
		if (tld = domainVal.match(/\.[a-z]{2,3}\.[a-z]{2}$/i)){
			domainVal = domainVal.replace(/\.[a-z]{2,3}\.[a-z]{2}$/i, '');
			domainVal = domainVal.replace(/^(.+)\./ig, '');
			domainVal = domainVal+tld;
		}
		else if (tld = domainVal.match(/\.[a-z]{2,4}$/i)){
			domainVal = domainVal.replace(/\.[a-z]{2,4}$/i, '');
			domainVal = domainVal.replace(/(.+)\./ig, '');
			domainVal = domainVal+tld;
		}
		$(this).val(domainVal);
		$('#siteURL').val('http://www.'+domainVal);
		$('#siteEmail').val('info@'+domainVal);
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

<h1 class="headingleft">Editar Site: <?php echo $data['siteDomain']; ?> <small>(<a href="<?php echo site_url('/halogy/sites'); ?>">Volte para Sites</a>)</small></h1></h1>

<div class="headingright">
	<input type="submit" value="Editar Site" class="button" />
</div>

<?php if ($errors = validation_errors()): ?>
	<div class="error clear">
		<?php echo $errors; ?>
	</div>
<?php endif; ?>

<div class="clear"></div>

<ul class="innernav clear">
	<li class="selected"><a href="#tab1" class="showtab">Detalhes</a></li>
	<li><a href="#tab2" class="showtab">Permissões</a></li>
</ul>

<br class="clear" />

<div id="tab1" class="tab">

	<h2>Domínios</h2>

	<label for="siteDomain">Domínio:</label>
	<?php echo @form_input('siteDomain', set_value('siteDomain', $data['siteDomain']), 'id="siteDomain" class="formelement"'); ?>
	<span class="tip">Por exemplo 'meusite.com.br' (sem sub-domínios, www ou trailing slashes)</span><br class="clear" />
	
	<label for="altDomain">Domínios estacionados:</label>
	<?php echo @form_input('altDomain', set_value('altDomain', $data['altDomain']), 'id="altDomain" class="formelement"'); ?>
	<span class="tip">Alternativa opcional a domínios estacionados.</span><br class="clear" /><br />

	<h2>Detalhes do Site</h2>

	<label for="siteName">Nome do Site:</label>
	<?php echo @form_input('siteName', set_value('siteName', $data['siteName']), 'id="siteName" class="formelement"'); ?>
	<span class="tip">O nome do site</span><br class="clear" />

	<label for="siteURL">Domínio (URL):</label>
	<?php echo @form_input('siteURL', set_value('siteURL', $data['siteURL']), 'id="siteURL" class="formelement"'); ?>
	<span class="tip">Endereço completo do site</span><br class="clear" />

	<label for="siteEmail">E-mail:</label>
	<?php echo @form_input('siteEmail', set_value('siteEmail', $data['siteEmail']), 'id="siteEmail" class="formelement"'); ?>
	<span class="tip">E-mail de contato</span><br class="clear" />

	<label for="siteTel">Telefone:</label>
	<?php echo @form_input('siteTel', set_value('siteTel', $data['siteTel']), 'id="siteTel" class="formelement"'); ?>
	<span class="tip">Número de telefone de contato</span><br class="clear" />
	<br class="clear" />

	<label for="active">Status:</label>
	<?php
		$actives = array(
			1 => 'Ativado',
			0 => 'Suspenso',
		);	
		echo @form_dropdown('active', $actives, $data['active'], 'id="active" class="formelement"');
	?>
	<span class="tip">Você não pode apagar os sites, mas pode suspeder deixando ele offline por aqui.</span>
	<br class="clear" />

</div>

<div id="tab2" class="tab">

	<h2>Permissões</h2>

	<p><a href="#" class="selectall button small nolabel grey">Marcar todos</a> <a href="#" class="deselectall button small nolabel grey">Desmarcar todos</a></p>

	<?php if ($permissions): ?>
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
	
</div>

<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Voltar para o topo</a></p>
	
</form>
