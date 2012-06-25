<script type="text/javascript">
function hidetax(){
	if ($('#shopTax').val() == 0){
		$('.hidetax, .hidetaxstate').hide();
	} else if ($('#shopTax').val() == 1 || $('#shopTax').val() == 2){
		$('.hidetax').show();
		if ($('#shopTax').val() == 2){
			$('.hidetaxstate').show();
		} else {
			$('.hidetaxstate').hide();
		}
	}
}
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
	$('div.tab:not(:first)').hide();
	$('#shopTax').change(function(){
		hidetax();
	});
	hidetax();
});
</script>

<form method="post" action="<?php echo site_url($this->uri->uri_string()); ?>" class="default">

<h1 class="headingleft">Editar o site: <?php echo $data['siteDomain']; ?></h1>

<div class="headingright">
	<input type="submit" value="Atualizar" class="button" />
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

<ul class="innernav clear">
	<li class="selected"><a href="#siteconfig" class="showtab">Site</a></li>
	<li><a href="#emailsconfig" class="showtab">E-mails</a></li>
<?php if (@in_array('shop', $this->permission->permissions)): ?>	
	<li><a href="#shopconfig" class="showtab">Loja</a></li>
<?php endif; ?>
<?php if (@in_array('community', $this->permission->permissions)): ?>	
	<li><a href="#ceconfig" class="showtab">Comunidade</a></li>
<?php endif; ?>
</ul>

<br class="clear" />

<div id="siteconfig" class="tab">

	<h2>Detalhes do site</h2>
	
	<label for="siteName">Nome do site:</label>
	<?php echo @form_input('siteName', set_value('siteName', $data['siteName']), 'id="siteName" class="formelement"'); ?>
	<span class="tip">Informe os detalhes do seu site, incluindo o nome, endereço, e-mail e telefone.</span>
	<br class="clear" />
	
	<label for="siteURL">Domínio:</label>
	<?php echo @form_input('siteURL', set_value('siteURL', $data['siteURL']), 'id="siteURL" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="siteEmail">E-mail:</label>
	<?php echo @form_input('siteEmail', set_value('siteEmail', $data['siteEmail']), 'id="siteEmail" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="siteTel">Telefone:</label>
	<?php echo @form_input('siteTel', set_value('siteTel', $data['siteTel']), 'id="siteTel" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="siteAddress">Endereço:</label>
	<?php echo @form_textarea('siteAddress', set_value('siteAddress', $data['siteAddress']), 'id="siteAddress" class="formelement small"'); ?>
	<br class="clear" />

	<label for="siteCountry">País:</label>
	<?php echo display_countries('siteCountry', $data['siteCountry'], 'id="siteCountry" class="formelement"'); ?>
	<br class="clear" /><br />
	
<?php if (@in_array('emailer', $this->permission->permissions)): ?>
	
	<label for="emailerEmail">E-mail de envio:</label>
	<?php echo @form_input('emailerEmail', set_value('emailerEmail', $data['emailerEmail']), 'id="emailerEmail" class="formelement"'); ?>
	<span class="tip">Este endereço de e-mail será de onde será enviado.</span><br class="clear" />
	
	<label for="emailerName">From Name:</label>
	<?php echo @form_input('emailerName', set_value('emailerName', $data['emailerName']), 'id="emailerName" class="formelement"'); ?>
	<span class="tip">Who do you want to say emails are from (optional)?</span><br class="clear" /><br />

<?php endif; ?>	
	
	<h2>Preferências do site</h2>
	
	<label for="headlines">Fuso horário:</label>
	<?php echo timezone_menu($data['timezone'], 'formelement', 'timezone'); ?>
	<br class="clear" />
	
	<label for="dateOrder">Formato da data:</label>
	<?php
		$values = '';
		$values = array(
			'DM' => 'Dia/Mês',
			'MD' => 'Mês/Dia'
		);
	?>
	<?php echo @form_dropdown('dateOrder', $values, set_value('dateOrder', $data['dateOrder']), 'id="dateOrder" class="formelement"'); ?>
	<span class="tip">Selecione qual o formato.</span>
	<br class="clear" />
	
	<label for="paging">Resultado por páginas:</label>
	<?php
		$values = '';
		$values = array(
			10 => 10,
			20 => 20,
			30 => 30,
			50 => 50,
			100 => 100
		);
	?>
	<?php echo @form_dropdown('paging', $values, set_value('paging', $data['paging'], 20), 'id="paging" class="formelement"'); ?>
	<span class="tip">Selecione a quantidade de resultado aparecerá por páginas.</span>
	<br class="clear" />
	
	<label for="headlines">Destaques:</label>
	<?php
		$values = '';
		$values = array(
			1 => 1,
			2 => 2,
			3 => 3,
			4 => 4,
			5 => 5,
			6 => 6,
			7 => 7,
			8 => 8,
			9 => 9,
			10 => 10,
			20 => 20
		);
	?>
	<?php echo @form_dropdown('headlines', $values, set_value('headlines', $data['headlines'], 20), 'id="headlines" class="formelement"'); ?>
	<span class="tip">Selecione quandos destaques quer que apareça no módulo de notícias.</span>
	<br class="clear" />
	
</div>

<div id="emailsconfig" class="tab">

	<h2>E-mails</h2>
	
	<label for="emailHeader">Cabeçário dos E-mails:</label>
	<?php echo @form_textarea('emailHeader', set_value('emailHeader', $data['emailHeader']), 'id="emailHeader" class="formelement small"'); ?>
	<br class="clear" />
	<span class="tip nolabel">Personalize o inicio dos e-mails que serão enviados. Você pode personalizar usando {name} e {email}.</span>
	<br class="clear" /><br />
	
	<label for="emailFooter">Rodapé E-mail:</label>
	<?php echo @form_textarea('emailFooter', set_value('emailFooter', $data['emailFooter']), 'id="emailFooter" class="formelement small"'); ?>
	<br class="clear" />
	<span class="tip nolabel">Personalize o final dos e-mails que serão enviados.</span>
	<br class="clear" /><br />
	
	<label for="emailTicket">Ticket E-mail:</label>
	<?php echo @form_textarea('emailTicket', set_value('emailTicket', $data['emailTicket']), 'id="emailTicket" class="formelement small"'); ?>
	<br class="clear" />
	<span class="tip nolabel">Personalize os emails que serão enviados em Novo tickets.</span>
	<br class="clear" /><br />
	
	<?php if (@in_array('community', $this->permission->sitePermissions)): ?>
	
		<label for="emailAccount">Nova conta de E-mail:</label>
		<?php echo @form_textarea('emailAccount', set_value('emailAccount', $data['emailAccount']), 'id="emailAccount" class="formelement small"'); ?>
		<br class="clear" />
		<span class="tip nolabel">Personalize o email de nova conta criada.</span>
		<br class="clear" /><br />
	
	<?php endif; ?>
	
	<?php if (@in_array('shop', $this->permission->sitePermissions)): ?>
	
		<label for="emailOrder">E-mail de pedidos da Loja:</label>
		<?php echo @form_textarea('emailOrder', set_value('emailOrder', $data['emailOrder']), 'id="emailOrder" class="formelement small"'); ?>
		<br class="clear" />
		<span class="tip nolabel">Personalize o email de novo pedido na Loja.</span>
		<br class="clear" /><br />
		
		<label for="emailDispatch">E-Mail de Frete:</label>
		<?php echo @form_textarea('emailDispatch', set_value('emailDispatch', $data['emailDispatch']), 'id="emailDispatch" class="formelement small"'); ?>
		<br class="clear" />
		<span class="tip nolabel">Personalize o e-mail de frete.</span>
		<br class="clear" /><br />
	
		<label for="emailDonation">E-mail de doação:</label>
		<?php echo @form_textarea('emailDonation', set_value('emailDonation', $data['emailDonation']), 'id="emailDonation" class="formelement small"'); ?>
		<br class="clear" />
		<span class="tip nolabel">Personalize o e-mail de nova doação.</span>
		<br class="clear" /><br />
	
		<label for="emailSubscription">E-mail de cadastro:</label>
		<?php echo @form_textarea('emailSubscription', set_value('emailSubscription', $data['emailSubscription']), 'id="emailSubscription" class="formelement small"'); ?>
		<br class="clear" />
		<span class="tip nolabel">Personalize o e-mail de envio de cadastro.</span>
		<br class="clear" /><br />

	<?php endif; ?>

</div>

<?php if (@in_array('shop', $this->permission->sitePermissions)): ?>

<div id="shopconfig" class="tab">

	<h2>Preferências da Loja</h2>
	
	<label for="currency">Currency:</label>
	<?php echo @form_dropdown('currency', currencies(), set_value('currency', $data['currency']), 'id="currency" class="formelement"'); ?>
	<br class="clear" />

	<label for="shopGateway">Formas de Pagamentos:</label>
	<?php
		$values = '';
		$values = array(
			'paypal'      => 'PayPal',
			'paypalpro'   => 'PayPal Pro',
			'authorize'   => 'Authorize.net',
			'rbsworldpay' => 'RBS Worldpay',
			'sagepay'     => 'SagePay'
		);
	?>
	<?php echo @form_dropdown('shopGateway', $values, set_value('shopGateway', $data['shopGateway']), 'id="shopGateway" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="shopEmail">PayPal Email:</label>
	<?php echo @form_input('shopEmail', set_value('shopEmail', $data['shopEmail']), 'id="shopEmail" class="formelement"'); ?>
	<span class="tip">The PayPal email you have configured for taking payments.</span>
	<br class="clear" />
	
	<label for="shopItemsPerPage">Items per Page:</label>
	<?php echo @form_input('shopItemsPerPage', set_value('shopItemsPerPage', $data['shopItemsPerPage']), 'id="shopItemsPerPage" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="shopItemsPerRow">Items per Row:</label>
	<?php echo @form_input('shopItemsPerRow', set_value('shopItemsPerRow', $data['shopItemsPerRow']), 'id="shopItemsPerRow" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="shopFreePostage">Frete grátis?:</label>
	<?php
		$values = '';
		$values = array(
			0 => 'Não',
			1 => 'Sim'
		);
	?>
	<?php echo @form_dropdown('shopFreePostage', $values, set_value('shopFreePostage', $data['shopFreePostage']), 'id="shopFreePostage" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="shopFreePostageRate">Free Shipping Rate:</label>
	<?php echo @form_input('shopFreePostageRate', set_value('shopFreePostageRate', $data['shopFreePostageRate']), 'id="shopFreePostageRate" class="formelement"'); ?>
	<span class="tip">The rate at which free postage is triggered.</span>
	<br class="clear" />
	
	<label for="shopStockControl">Controle de estoque:</label>
	<?php
		$values = '';
		$values = array(
			0 => 'No, don\'t use stock control',
			1 => 'Yes, purchases affect stock'
		);
	?>
	<?php echo @form_dropdown('shopStockControl', $values, set_value('shopStockControl', $data['shopStockControl']), 'id="shopStockControl" class="formelement"'); ?>
	<br class="clear" />
	
	<label for="shopTax">Apply Tax?</label>
	<?php
		$values = '';
		$values = array(
			0 => 'No, don\'t apply tax',
			1 => 'Yes, always apply tax',
			2 => 'Yes, but apply by state'
		);
	?>
	<?php echo @form_dropdown('shopTax', $values, set_value('shopTax', $data['shopTax']), 'id="shopTax" class="formelement"'); ?>
	<br class="clear" />
	
	<div class="hidetax">
	
		<label for="shopTaxRate">Tax Rate:</label>
		<?php echo @form_input('shopTaxRate',set_value('shopTaxRate', $data['shopTaxRate']), 'id="shopTaxRate" class="formelement small"'); ?>
		<span class="price">%</span>
		<br class="clear" />
	
		<div class="hidetaxstate">
			
			<label for="shopTaxState">Tax by State:</label>
			<?php echo display_states('shopTaxState', $data['shopTaxState'], 'id="shopTaxState" class="formelement"'); ?>
			<br class="clear" />
		
		</div>
		
	</div>
	
	<label for="shopVariation1">Variation 1:</label>
	<?php echo @form_input('shopVariation1', set_value('shopVariation1', $data['shopVariation1']), 'id="shopVariation1" class="formelement"'); ?>
	<br class="clear" />	

	<label for="shopVariation2">Variation 2:</label>
	<?php echo @form_input('shopVariation2', set_value('shopVariation2', $data['shopVariation2']), 'id="shopVariation2" class="formelement"'); ?>
	<br class="clear" />	

	<label for="shopVariation3">Variation 3:</label>
	<?php echo @form_input('shopVariation3', set_value('shopVariation3', $data['shopVariation3']), 'id="shopVariation3" class="formelement"'); ?>
	<br class="clear" /><br />
	
	<h3>Shop API Setup:</h3>
	
	<label for="shopAPIKey">API Key:</label>
	<?php echo @form_input('shopAPIKey', set_value('shopAPIKey', $data['shopAPIKey']), 'id="shopAPIKey" class="formelement"'); ?>
	<br class="clear" />

	<label for="shopAPIUser">User / ID:</label>
	<?php echo @form_input('shopAPIUser', set_value('shopAPIUser', $data['shopAPIUser']), 'id="shopAPIUser" class="formelement"'); ?>
	<br class="clear" />

	<label for="shopAPIPass">Password:</label>
	<?php echo @form_input('shopAPIPass', set_value('shopAPIPass', $data['shopAPIPass']), 'id="shopAPIPass" class="formelement"'); ?>
	<br class="clear" />

	<label for="shopVendor">Vendor:</label>
	<?php echo @form_input('shopVendor', set_value('shopVendor', $data['shopVendor']), 'id="shopVendor" class="formelement"'); ?>
	<br class="clear" />

	
</div>

<?php endif; ?>

<div id="ceconfig" class="tab">

<?php if (@in_array('community', $this->permission->sitePermissions)): ?>

	<h2>Preferências de Comunidade</h2>

	<label for="activation">Ativação manual:</label>
	<?php
		$values = '';
		$values = array(
			0 => 'Não',
			1 => 'Sim'
		);
	?>
	<?php echo @form_dropdown('activation', $values, set_value('activation', $data['activation']), 'id="activation" class="formelement"'); ?>
	<span class="tip">O usuário requer ativação manual?</span><br class="clear" /><br />

<?php endif; ?>

</div>

<p class="clear" style="text-align: right;"><a href="#" class="button grey" id="totop">Volta para o topo</a></p>
	
</form>
